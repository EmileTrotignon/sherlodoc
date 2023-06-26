open Db

type s =
  | All
  | Empty
  | Array of Elt.t array
  | Inter of s * s
  | Union of s * s

type t =
  { cardinal : int
  ; s : s
  }

let rec pprint =
  let open PPrint in
  function
  | All -> !^"All"
  | Empty -> !^"Empty"
  | Array arr -> braces (arr |> Array.to_list |> separate_map space Elt.pprint)
  | Inter (l, r) ->
      !^"Inter" ^^ align (hardline ^^ pprint l ^^ hardline ^^ pprint r)
  | Union (l, r) ->
      !^"Union" ^^ align (hardline ^^ pprint l ^^ hardline ^^ pprint r)

let all = { cardinal = -1; s = All }
let empty = { cardinal = 0; s = Empty }

let of_array arr =
  if Array.is_empty arr
  then empty
  else { cardinal = Array.length arr; s = Array arr }

let inter a b =
  match a.s, b.s with
  | Empty, _ | _, Empty -> empty
  | _, All -> a
  | All, _ -> b
  | x, y when x == y -> a
  | x, y ->
      let x, y = if a.cardinal < b.cardinal then x, y else y, x in
      { cardinal = min a.cardinal b.cardinal; s = Inter (x, y) }

let union a b =
  match a.s, b.s with
  | Empty, _ -> b
  | _, Empty -> a
  | All, _ | _, All -> all
  | x, y when x == y -> a
  | x, y ->
      let x, y = if a.cardinal < b.cardinal then x, y else y, x in
      { cardinal = a.cardinal + b.cardinal; s = Union (x, y) }

let union_of_array arr =
  let rec loop lo hi =
    match hi - lo with
    | 0 -> empty
    | 1 -> arr.(lo)
    | dist ->
        let left = loop lo (lo + (dist / 2)) in
        let right = loop (lo + (dist / 2)) hi in
        union left right
  in
  loop 0 (Array.length arr)

let union_of_list li = li |> Array.of_list |> union_of_array

let best x y =
  match Elt.compare x y with
  | 0 -> x
  | c when c < 0 -> x
  | _ -> y

let update_candidate old_cand new_cand =
  Some
    (match old_cand with
    | Some old_cand -> best old_cand new_cand
    | None -> new_cand)

let best_opt old_cand new_cand =
  match old_cand, new_cand with
  | None, None -> None
  | None, Some z | Some z, None -> Some z
  | Some x, Some y -> Some (best x y)

let rec succ_ge depth t elt =
  (* Printf.printf "depth : %i\n" depth ; *)
  let depth = depth + 1 in
  match t with
  | All -> invalid_arg "Succ.succ_rec All"
  | Empty -> None
  | Array arr -> Array.succ_ge ~compare:Elt.compare elt arr
  | Union (l, r) ->
      let elt_r = succ_ge depth r elt in
      let elt_l = succ_ge depth l elt in
      best_opt elt_l elt_r
  | Inter (l, r) ->
      let open Option.O in
      let rec loop elt_r =
        let* elt_l = succ_ge depth l elt_r in
        let* elt_r = succ_ge depth r elt_l in
        if Elt.(elt_l = elt_r) then Some elt_l else loop elt_r
      in
      loop elt

let rec succ_gt depth t elt =
  (* Printf.printf "depth : %i\n" depth ; *)
  let depth = depth + 1 in
  match t with
  | All -> invalid_arg "Succ.succ_rec All"
  | Empty -> None
  | Array arr -> Array.succ_gt ~compare:Elt.compare elt arr
  | Union (l, r) ->
      let elt_r = succ_gt depth r elt in
      let elt_l = succ_gt depth l elt in
      best_opt elt_l elt_r
  | Inter (l, r) ->
      let open Option.O in
      let rec loop elt_r =
        let* elt_l = succ_gt depth l elt_r in
        let* elt_r = succ_ge depth r elt_l in
        if Elt.(elt_l = elt_r) then Some elt_l else loop elt_r
      in
      loop elt

let succ_gt t elt = succ_gt 0 t elt

let rec first candidate t =
  match t with
  | All -> invalid_arg "Succ.first All"
  | Empty -> None
  | Array s -> ( try update_candidate candidate s.(0) with e -> raise e)
  | Inter (a, _b) -> (*todo correct*) first candidate a
  | Union (a, b) -> begin
      let a = first candidate a in
      let candidate = best_opt candidate a in
      first candidate b
    end

let first = first None

let first_exn t =
  match first t with
  | Some v -> v
  | None -> raise Not_found

let to_seq t =
  (* PPrint.ToChannel.pretty 0.8 80 stdout (pprint t) ; *)
  let state = ref (true, None) in
  let loop () =
    let elt =
      match !state with
      | true, None -> first t
      | false, None -> None
      | _, Some previous_elt -> succ_gt t previous_elt
    in
    state := false, elt ;
    elt
  in
  let next () = try Printexc.print loop () with _ -> None in
  Seq.of_dispenser next

let to_seq t = to_seq t.s
