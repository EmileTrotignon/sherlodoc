include Stdlib.List

(* Same as Stdlib, except for the tmc annotation that does not make it slower
   but prevents stack overflows on the browser. *)
let[@tail_mod_cons] rec map f = function
  | [] -> []
  | a :: l ->
      let r = f a in
      r :: map f l

let to_string ?(start = "[") ?(sep = "; ") ?(end_ = "]") a li =
  start ^ (li |> map a |> String.concat sep) ^ end_

let pprint ?(start = "[") ?(sep = "; ") ?(end_ = "]") a li =
  start ^ (li |> map a |> String.concat sep) ^ end_
