(** This module provides a way to do memory-sharing after the fact, for 
    a nuumber a OCaml types. 
    Every sharable element inside a type is also shared.*)



val clear : unit -> unit
(** [clear ()] removes every value from the caches of every types. *)

(** A type [t] and its [memo] function. *)
module type Cached = sig
  type t

  val memo : t -> t
  (** [memo v] is [v] with the maximum amount of shared memory. As side effect 
      is to register [v] and its subvalues to be shared in the future. *)
end

module String : Cached with type t = string
module Char_list : Cached with type t = char list
module String_list : Cached with type t = string list
module String_list_list : Cached with type t = string list list
module Kind : Cached with type t = Elt.Kind.t
module Elt_array : Cached with type t = Elt.t array
module Elt_array_occ : Cached with type t = Elt.t array Int.Map.t
