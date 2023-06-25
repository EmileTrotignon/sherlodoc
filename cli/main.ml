let pp_or cond pp_true pp_false ppf = if cond then pp_true ppf else pp_false ppf

let print_result ~print_cost
    Db.Elt.{ name; rhs; url = _; kind; score; doc_html = _; pkg = _ } =
  let score = if print_cost then string_of_int score ^ " " else "" in
  let kind = kind |> Db.Elt.Kind.to_string |> Unescape.string in
  let name = Unescape.string name in
  let pp_rhs h = function
    | None -> ()
    | Some rhs -> Format.fprintf h "%s" (Unescape.string rhs)
  in
  Format.printf "%s%s %s%a\n" score kind name pp_rhs rhs

let search ~print_cost ~db query =
  match Query.(api ~shards:db { query; packages = []; limit = 50 }) with
  | _, [] -> print_endline "[No results]"
  | _, (_ :: _ as results) ->
      List.iter (print_result ~print_cost) results ;
      flush stdout

let rec search_loop ~print_cost ~db =
  match In_channel.input_line stdin with
  | Some query ->
      search ~print_cost ~db query ;
      search_loop ~print_cost ~db
  | None -> print_endline "[Search session ended]"

let main db query print_cost =
  match db with
  | None ->
      output_string stderr
        "No database provided. Provide one by exporting the SHERLODOC_DB \
         variable, or using the --db option\n" ;
      exit 1
  | Some db -> (
      let db = Storage_marshal.load db in
      match query with
      | None -> search_loop ~print_cost ~db
      | Some query -> search ~print_cost ~db query)

open Cmdliner

let db_filename =
  let env =
    let doc = "The database to query" in
    Cmd.Env.info "SHERLODOC_DB" ~doc
  in
  Arg.(value & opt (some file) None & info [ "db" ] ~docv:"DB" ~env)

let limit =
  let doc = "The maximum number of results" in
  Arg.(value & opt int 50 & info [ "limit"; "n" ] ~docv:"N" ~doc)

let query =
  let doc = "The query" in
  Arg.(value & pos 0 (some string) None & info [] ~docv:"QUERY" ~doc)

let print_cost =
  let doc = "Prints cost of each result" in
  Arg.(value & flag & info [ "print-cost" ] ~doc)

let main = Term.(const main $ db_filename $ query $ print_cost)

let cmd =
  let doc = "CLI interface to query sherlodoc" in
  let info = Cmd.info "sherlodoc" ~doc in
  Cmd.v info main

let () = exit (Cmd.eval cmd)