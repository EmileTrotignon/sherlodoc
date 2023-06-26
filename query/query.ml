module Parser = Query_parser
module Succ = Succ
module Sort = Sort
module Storage = Db.Storage
module Tree = Db.Suffix_tree.With_elts
module Tree_occ = Db.Suffix_tree.With_occ
open Db.Types
module Occ = Int.Map

let inter_list xs = List.fold_left Succ.inter Succ.all xs

let collapse_occ ~count occs =
  Occ.fold
    (fun k x acc -> if k < count then acc else Succ.union (Succ.of_array x) acc)
    occs Succ.empty

let collapse_tree_occ ~count t =
  t |> Tree_occ.immediate_sets |> collapse_occ ~count

let collapse_tree_occ_polar ~count ~polarity t =
  t
  |> Tree_occ.sets_with_parent ~parent:polarity
  |> List.map (collapse_occ ~count)
  |> Succ.union_of_list

let collapse_tree t =
  let t = Tree.to_sets t in
  let t = List.map Succ.of_array t in
  let t = Succ.union_of_list t in
  t

let find_types ~shards names =
  List.fold_left
    (fun acc shard ->
      let db = shard.db_types in
      let r =
        inter_list
        @@ List.map
             (fun (name, count) ->
               let name' = String.concat "" name in
               match Tree_occ.find db name' with
               | Ok tree -> collapse_tree_occ ~count tree
               | Error (`Stopped_at (i, sub_tree)) ->
                   if i = String.length name' - 1
                   then
                     let polarity = name'.[i] in
                     match polarity with
                     | '-' | '+' ->
                         collapse_tree_occ_polar ~polarity ~count sub_tree
                     | _ -> Succ.empty
                   else Succ.empty)
             (regroup names)
      in
      Succ.union acc r)
    Succ.empty shards

let find_names ~(shards : Db.t list) names =
  let names =
    List.map (fun n -> (*String.rev *) String.lowercase_ascii n) names
  in
  List.fold_left
    (fun acc shard ->
      let db_names = shard.db_names in
      let candidates =
        List.map
          (fun name ->
            match Tree.find db_names name with
            | Ok tree -> collapse_tree tree
            | Error _ -> Succ.empty)
          names
      in
      let candidates = inter_list candidates in
      Succ.union acc candidates)
    Succ.empty shards

type t =
  { query : string
  ; packages : string list
  ; limit : int
  }

let search ~(shards : Db.t list) query_name query_typ =
  let results_name = find_names ~shards query_name in
  let results =
    match query_typ with
    | None -> results_name
    | Some query_typ ->
        let results_typ = find_types ~shards query_typ in
        Succ.inter results_name results_typ
  in
  results

let match_packages ~packages { Db.Elt.pkg; _ } =
  match pkg with
  | Some { name; version = _ } -> List.exists (String.equal name) packages
  | None -> false

let match_packages ~packages results =
  match packages with
  | [] -> results
  | _ -> Seq.filter (match_packages ~packages) results

let api ~(shards : Db.t list) params =
  let query_name, query_typ, query_typ_arrow, pretty =
    Parser.of_string params.query
  in
  let results = search ~shards query_name query_typ in
  let results = Succ.to_seq results in
  let results = match_packages ~packages:params.packages results in
  let results = List.of_seq @@ Seq.take params.limit results in
  let results = Sort.list query_name query_typ_arrow results in
  pretty, results
