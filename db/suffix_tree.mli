module type SET = sig
  type t
  type elt

  val of_list : elt list -> t
  val is_empty : t -> bool
  val pprint : t -> PPrint.document
  val pprint_elt : elt -> PPrint.document
end

module Make (S : SET) : sig
  type writer
  (** A writer is an incomplete suffix tree.
      You can add suffixes to it. *)

  val make : unit -> writer
  val add_suffixes : writer -> string -> S.elt -> unit

  type reader
  (** A reader is a completed suffix tree. You can make queries on it.*)

  val export : writer -> reader
  val find :
    reader -> string -> (reader, [> `Stopped_at of int * reader ]) result
  val to_sets : reader -> S.t list
  val immediate_sets : reader -> S.t
  val sets_with_parent : parent:char -> reader -> S.t list
  val pprint : reader -> PPrint.document
end

module With_elts : module type of Make (struct
include Elt.Array

let of_list li = li |> of_list |> Cache.Elt_array.memo
end)
module With_occ : module type of Make (Occ)
