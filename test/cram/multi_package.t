  $ tar -xf odocls.tar
  $ export ODOCLS=$(find ./docs/odoc/ -name '*.odocl' | sort)
  $ echo $ODOCLS | wc -w
  2553
  $ export SHERLODOC_DB=db.bin
  $ export SHERLODOC_FORMAT=ancient
  $ sherlodoc index --index-docstring=false $ODOCLS > /dev/null
  $ sherlodoc search --print-cost --limit 100 "S_poly"
  195 val Base.Set.S_poly.mem : 'a t -> 'a -> bool
  202 val Base.Hashtbl.S_poly.data : (_, 'b) t -> 'b list
  206 val Base.Hashtbl.S_poly.keys : ('a, _) t -> 'a key list
  212 val Base.Set.S_poly.map : ('a, _) set -> f:('a -> 'b) -> 'b t
  212 val Base.Hashtbl.S_poly.find_exn : ('a, 'b) t -> 'a key -> 'b
  213 val Base.Hashtbl.S_poly.choose_exn : ('a, 'b) t -> 'a key * 'b
  215 sig Base.Map.S_poly
  215 sig Base.Set.S_poly
  215 val Base.Hashtbl.S_poly.find : ('a, 'b) t -> 'a key -> 'b option
  218 val Base.Hashtbl.S_poly.choose : ('a, 'b) t -> ('a key * 'b) option
  218 val Base.Hashtbl.S_poly.to_alist : ('a, 'b) t -> ('a key * 'b) list
  219 sig Base.Hashtbl.S_poly
  221 val Base.Hashtbl.S_poly.map : ('a, 'b) t -> f:('b -> 'c) -> ('a, 'c) t
  222 val Base.Hashtbl.S_poly.map_inplace : (_, 'b) t -> f:('b -> 'b) -> unit
  222 val Base.Hashtbl.S_poly.remove_multi : ('a, _ list) t -> 'a key -> unit
  224 val Base.Hashtbl.S_poly.set : ('a, 'b) t -> key:'a key -> data:'b -> unit
  224 val Base.Hashtbl.S_poly.find_multi : ('a, 'b list) t -> 'a key -> 'b list
  226 val Base.Hashtbl.S_poly.find_and_remove : ('a, 'b) t -> 'a key -> 'b option
  235 val Base.Hashtbl.S_poly.update : ('a, 'b) t -> 'a key -> f:('b option -> 'b) -> unit
  235 val Base.Hashtbl.S_poly.add_multi : ('a, 'b list) t -> key:'a key -> data:'b -> unit
  235 val Base.Hashtbl.S_poly.filter_map : ('a, 'b) t -> f:('b -> 'c option) -> ('a, 'c) t
  236 val Base.Hashtbl.S_poly.filter_map_inplace : (_, 'b) t -> f:('b -> 'b option) -> unit
  236 val Base.Hashtbl.S_poly.filter_keys_inplace : ('a, _) t -> f:('a key -> bool) -> unit
  237 val Base.Hashtbl.S_poly.equal : ('b -> 'b -> bool) -> ('a, 'b) t -> ('a, 'b) t -> bool
  238 val Base.Hashtbl.S_poly.iteri : ('a, 'b) t -> f:(key:'a key -> data:'b -> unit) -> unit
  239 val Base.Hashtbl.S_poly.find_or_add : ('a, 'b) t -> 'a key -> default:(unit -> 'b) -> 'b
  240 val Base.Hashtbl.S_poly.add : ('a, 'b) t -> key:'a key -> data:'b -> [ `Ok | `Duplicate ]
  241 val Base.Hashtbl.S_poly.mapi : ('a, 'b) t -> f:(key:'a key -> data:'b -> 'c) -> ('a, 'c) t
  242 val Base.Hashtbl.S_poly.change : ('a, 'b) t -> 'a key -> f:('b option -> 'b option) -> unit
  242 val Base.Hashtbl.S_poly.findi_or_add : ('a, 'b) t -> 'a key -> default:('a key -> 'b) -> 'b
  244 val Base.Hashtbl.S_poly.update_and_return : ('a, 'b) t -> 'a key -> f:('b option -> 'b) -> 'b
  245 val Base.Hashtbl.S_poly.partition_tf : ('a, 'b) t -> f:('b -> bool) -> ('a, 'b) t * ('a, 'b) t
  246 val Base.Hashtbl.S_poly.incr : ?by:int -> ?remove_if_zero:bool -> ('a, int) t -> 'a key -> unit
  254 val Base.Hashtbl.S_poly.choose_randomly_exn : ?random_state:Random.State.t -> ('a, 'b) t -> 'a key * 'b
  255 val Base.Hashtbl.S_poly.filter_mapi : ('a, 'b) t -> f:(key:'a key -> data:'b -> 'c option) -> ('a, 'c) t
  258 val Base.Hashtbl.S_poly.fold : ('a, 'b) t -> init:'acc -> f:(key:'a key -> data:'b -> 'acc -> 'acc) -> 'acc
  259 val Base.Hashtbl.S_poly.partition_map : ('a, 'b) t -> f:('b -> ('c, 'd) Either.t) -> ('a, 'c) t * ('a, 'd) t
  259 val Base.Hashtbl.S_poly.choose_randomly : ?random_state:Random.State.t -> ('a, 'b) t -> ('a key * 'b) option
  265 val Base.Hashtbl.S_poly.partitioni_tf : ('a, 'b) t -> f:(key:'a key -> data:'b -> bool) -> ('a, 'b) t * ('a, 'b) t
  272 type ('a, 'b) Base.Map.S_poly.t
  272 type 'elt Base.Set.S_poly.t
  274 type ('a, 'cmp) Base.Set.S_poly.set
  275 type ('a, 'b) Base.Map.S_poly.tree
  275 type 'elt Base.Set.S_poly.tree
  276 type ('a, 'b) Base.Hashtbl.S_poly.t
  279 val Base.Hashtbl.S_poly.find_and_call : ('a, 'b) t ->
    'a key ->
    if_found:('b -> 'c) ->
    if_not_found:('a key -> 'c) ->
    'c
  283 val Base.Set.S_poly.empty : 'a t
  283 type 'a Base.Hashtbl.S_poly.key = 'a
  283 val Base.Hashtbl.S_poly.partition_mapi : ('a, 'b) t ->
    f:(key:'a key -> data:'b -> ('c, 'd) Either.t) ->
    ('a, 'c) t * ('a, 'd) t
  288 val Base.Map.S_poly.empty : ('k, _) t
  289 type Base.Map.S_poly.comparator_witness
  289 type Base.Set.S_poly.comparator_witness
  290 val Base.Set.S_poly.length : _ t -> int
  293 val Base.Set.S_poly.is_empty : _ t -> bool
  293 val Base.Set.S_poly.singleton : 'a -> 'a t
  294 val Base.Set.S_poly.choose_exn : 'a t -> 'a
  295 val Base.Set.S_poly.add : 'a t -> 'a -> 'a t
  295 val Base.Map.S_poly.length : (_, _) t -> int
  295 val Base.Set.S_poly.max_elt_exn : 'a t -> 'a
  295 val Base.Set.S_poly.min_elt_exn : 'a t -> 'a
  296 val Base.Set.S_poly.of_list : 'a list -> 'a t
  296 val Base.Set.S_poly.of_tree : 'a tree -> 'a t
  296 val Base.Set.S_poly.to_list : 'a t -> 'a list
  296 val Base.Set.S_poly.to_tree : 'a t -> 'a tree
  296 val Base.Set.S_poly.invariants : 'a t -> bool
  297 val Base.Set.S_poly.choose : 'a t -> 'a option
  297 val Base.Set.S_poly.elements : 'a t -> 'a list
  297 val Base.Hashtbl.S_poly.merge_into : src:('k, 'a) t ->
    dst:('k, 'b) t ->
    f:(key:'k key -> 'a -> 'b option -> 'b Merge_into_action.t) ->
    unit
  298 val Base.Map.S_poly.data : (_, 'v) t -> 'v list
  298 val Base.Map.S_poly.keys : ('k, _) t -> 'k list
  298 val Base.Set.S_poly.diff : 'a t -> 'a t -> 'a t
  298 val Base.Set.S_poly.remove : 'a t -> 'a -> 'a t
  298 val Base.Set.S_poly.max_elt : 'a t -> 'a option
  298 val Base.Set.S_poly.min_elt : 'a t -> 'a option
  298 val Base.Map.S_poly.is_empty : (_, _) t -> bool
  298 val Base.Set.S_poly.of_array : 'a array -> 'a t
  298 val Base.Set.S_poly.to_array : 'a t -> 'a array
  299 val Base.Set.S_poly.equal : 'a t -> 'a t -> bool
  299 val Base.Set.S_poly.inter : 'a t -> 'a t -> 'a t
  299 val Base.Set.S_poly.union : 'a t -> 'a t -> 'a t
  299 val Base.Hashtbl.S_poly.clear : (_, _) t -> unit
  299 val Base.Hashtbl.S_poly.length : (_, _) t -> int
  299 val Base.Hashtbl.S_poly.hashable : 'a Hashable.t
  300 val Base.Map.S_poly.mem : ('k, _) t -> 'k -> bool
  301 val Base.Set.S_poly.nth : 'a t -> int -> 'a option
  301 val Base.Set.S_poly.union_list : 'a t list -> 'a t
  302 val Base.Map.S_poly.invariants : ('k, 'v) t -> bool
  302 val Base.Hashtbl.S_poly.is_empty : (_, _) t -> bool
  302 val Base.Hashtbl.S_poly.find_and_call1 : ('a, 'b) t ->
    'a key ->
    a:'d ->
    if_found:('b -> 'd -> 'c) ->
    if_not_found:('a key -> 'd -> 'c) ->
    'c
  304 val Base.Map.S_poly.find_exn : ('k, 'v) t -> 'k -> 'v
  305 val Base.Map.S_poly.singleton : 'k -> 'v -> ('k, 'v) t
  305 val Base.Set.S_poly.remove_index : 'a t -> int -> 'a t
  306 val Base.Hashtbl.S_poly.copy : ('a, 'b) t -> ('a, 'b) t
  306 val Base.Map.S_poly.max_elt_exn : ('k, 'v) t -> 'k * 'v
  306 val Base.Map.S_poly.min_elt_exn : ('k, 'v) t -> 'k * 'v
  306 val Base.Set.S_poly.of_sequence : 'a Sequence.t -> 'a t
  306 val Base.Set.S_poly.are_disjoint : 'a t -> 'a t -> bool
  307 val Base.Map.S_poly.find : ('k, 'v) t -> 'k -> 'v option
  307 val Base.Map.S_poly.rank : ('k, _) t -> 'k -> int option
  307 val Base.Set.S_poly.compare_direct : 'a t -> 'a t -> int
  $ sherlodoc search --print-cost --no-rhs "group b"
  227 val Str.group_beginning
  230 val Re_str.group_beginning
  235 val Re.Str.group_beginning
  259 val Iter.group_succ_by
  259 val Re.Group.nb_groups
  265 val IterLabels.group_succ_by
  271 field Signature_group.in_place_patch.replace_by
  275 val Iter.group_by
  281 val Base.Set.group_by
  281 val IterLabels.group_by
  289 field Ocaml_typing.Signature_group.in_place_patch.replace_by
  295 val Stdlib.Seq.group
  295 val Iter.group_join_by
  301 val IterLabels.group_join_by
  320 val Brr_webgpu.Gpu.Bind_group.label
  332 val Brr_webgpu.Gpu.Bind_group.Layout.label
  334 val Ocamlformat_stdlib.List.group
  339 val Brr.Console.group
  352 type Brr_webgpu.Gpu.Bind_group.t
  356 val Brr.Console.group_end
  358 type 'a Note_brr_kit.Ui.Group.t
  360 val Base.List.group
  361 val Note_brr_kit.Ui.Group.enabled
  363 type Brr_webgpu.Gpu.Bind_group.Entry.t
  364 type Brr_webgpu.Gpu.Bind_group.Layout.t
  $ sherlodoc search --no-rhs "group by"
  val Iter.group_succ_by
  val IterLabels.group_succ_by
  field Signature_group.in_place_patch.replace_by
  val Iter.group_by
  val Base.Set.group_by
  val IterLabels.group_by
  field Ocaml_typing.Signature_group.in_place_patch.replace_by
  val Iter.group_join_by
  val IterLabels.group_join_by
  val Base.Set.Poly.group_by
  val Merlin_utils.Std.List.group_by
  val Base.Set.Using_comparator.group_by
  val Base.Set.Using_comparator.Tree.group_by
  val Base.Set.S_poly.group_by
  val Base.Set.Accessors_generic.group_by
  val Base.Set.Creators_and_accessors_generic.group_by
  $ sherlodoc search --print-cost "map2"
  88 val Stdlib.Seq.map2 : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t
  98 val Stdlib.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  101 val Stdlib.Float.Array.map2 : (float -> float -> float) -> t -> t -> t
  102 val Gen.map2 : ('a -> 'b -> 'c) -> 'a gen -> 'b gen -> 'c gen
  102 val Stdlib.Array.map2 : ('a -> 'b -> 'c) -> 'a array -> 'b array -> 'c array
  106 val Stdlib.ListLabels.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  109 val Stdlib.Float.ArrayLabels.map2 : f:(float -> float -> float) -> t -> t -> t
  110 val GenLabels.map2 : f:('a -> 'b -> 'c) -> 'a gen -> 'b gen -> 'c gen
  110 val Stdlib.ArrayLabels.map2 : f:('a -> 'b -> 'c) -> 'a array -> 'b array -> 'c array
  117 val Gg.Float.Array.map2 : (float -> float -> float) -> t -> t -> t
  118 val B0_std.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  120 val Stdune.List.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  122 val Stdlib.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  124 val Stdune.Array.map2 : f:('a -> 'b -> 'c) -> 'a array -> 'b array -> 'c array
  124 val Parser_shims.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  125 val Gg.Float.ArrayLabels.map2 : f:(float -> float -> float) -> t -> t -> t
  129 val Caqti_common_priv.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  130 val Stdlib.ListLabels.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  131 val Alcotest_stdlib_ext.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  135 val Merlin_utils.Std.List.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  139 val Gen.Restart.map2 : ('a -> 'b -> 'c) -> 'a restartable -> 'b restartable -> 'c restartable
  139 val Ppx_deriving_yojson_runtime.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  142 val B0_std.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  142 val Base.Uniform_array.map2_exn : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  143 val Ppx_deriving_yojson_runtime.Array.map2 : ('a -> 'b -> 'c) -> 'a array -> 'b array -> 'c array

  $ sherlodoc search --print-cost --static-sort "List map2"
  78 val Stdlib.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  82 val Stdlib.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  86 val Stdlib.ListLabels.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  90 val Stdlib.ListLabels.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  97 val Base.List.rev_map2_exn : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  98 val B0_std.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  100 val Stdune.List.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  102 val B0_std.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  104 val Stdppx.List.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  104 val Stdune.List.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  104 val Parser_shims.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  108 val Parser_shims.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  109 val Caqti_common_priv.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  111 val Alcotest_stdlib_ext.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  111 val Ocamlformat_stdlib.List.rev_map2_exn : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  113 val Misc.Stdlib.List.map2_prefix : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t * 'b t
  113 val Caqti_common_priv.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  115 val Merlin_utils.Std.List.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  115 val Alcotest_stdlib_ext.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  119 val Merlin_utils.Std.List.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  119 val Ppx_deriving_yojson_runtime.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  123 val Ppx_deriving_yojson_runtime.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  126 val Js_of_ocaml_compiler.Stdlib.List.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  130 val Js_of_ocaml_compiler.Stdlib.List.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  131 val Parser_shims.Misc.Stdlib.List.map2_prefix : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t * 'b t

  $ sherlodoc search --print-cost "List map2"
  118 val Stdlib.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  138 val B0_std.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  140 val Stdune.List.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  142 val Stdlib.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  144 val Parser_shims.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  149 val Caqti_common_priv.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  151 val Alcotest_stdlib_ext.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  155 val Merlin_utils.Std.List.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  159 val Ppx_deriving_yojson_runtime.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  162 val B0_std.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  164 val Stdppx.List.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  164 val Stdune.List.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  166 val Js_of_ocaml_compiler.Stdlib.List.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  168 val Parser_shims.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  173 val Misc.Stdlib.List.map2_prefix : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t * 'b t
  173 val Caqti_common_priv.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  175 val Alcotest_stdlib_ext.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  177 val Base.List.rev_map2_exn : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  179 val Merlin_utils.Std.List.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  183 val Ppx_deriving_yojson_runtime.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  190 val Js_of_ocaml_compiler.Stdlib.List.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  191 val Ocamlformat_stdlib.List.rev_map2_exn : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  191 val Parser_shims.Misc.Stdlib.List.map2_prefix : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t * 'b t
  216 val Stdlib.ListLabels.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  240 val Stdppx.List.map2 : 'a list -> 'b list -> f:('c -> 'd -> 'e) -> 'f list

  $ sherlodoc search --no-rhs "Base.Hashtbl.S_without_submodules.group"
  val Base.Hashtbl.S_without_submodules.group
  $ sherlodoc search --print-cost "list"
  74 val B0_pack.list : unit -> t list
  74 val B0_unit.list : unit -> t list
  74 val Easy_format.list : list_param
  75 val Brr.At.list : Jstr.t cons
  76 val B0_cmdlet.list : unit -> t list
  82 val Logs.Src.list : unit -> src list
  83 val Angstrom.list : 'a t list -> 'a list t
  83 val Fmt.Dump.list : 'a t -> 'a list t
  83 val B0_def.Make.list : unit -> t list
  83 val Metrics.Src.list : unit -> t list
  83 val B0_opam.Cmdlet.list : B0_cmdlet.t
  84 val Fix.Enum.list : 'a list -> 'a enum
  84 val Logs.Tag.list : unit -> def_e list
  85 val Metrics.Graph.list : unit -> t list
  88 val Fmt.list : ?sep:unit t -> 'a t -> 'a list t
  89 val B0_std.Bincode.list : 'a t -> 'a list t
  89 val Stdlib.Stream.of_list : 'a list -> 'a t
  90 val B00_serialk_sexp.Sexp.list : t list -> t
  92 val Alcotest.list : 'a testable -> 'a list testable
  92 val Jv.of_jv_list : t list -> t
  92 val Jv.to_jv_list : t -> t list
  92 val Stdlib.Array.of_list : 'a list -> 'a array
  92 val Stdlib.Array.to_list : 'a array -> 'a list
  94 val Stdlib.Option.to_list : 'a option -> 'a list
  94 val Stdlib.Set.Make.of_list : elt list -> t
  $ sherlodoc search --print-cost ": list"
  75 val Stdlib.List.tl : 'a list -> 'a list
  75 val Topkg.Exts.cmx : ext list
  75 val Topkg.Exts.exe : ext list
  76 val Stdlib.List.rev : 'a list -> 'a list
  77 val Ocaml_version.arches : arch list
  78 val Config.flexdll_dirs : string list
  79 val Topkg.Exts.library : ext list
  80 val Stdlib.List.of_seq : 'a Seq.t -> 'a list
  81 val Stdlib.ListLabels.tl : 'a list -> 'a list
  81 val Topkg.Exts.c_library : ext list
  82 val Jv.to_jv_list : t -> t list
  82 val Stdlib.Array.to_list : 'a array -> 'a list
  82 val Stdlib.ListLabels.rev : 'a list -> 'a list
  84 val Fpath.segs : t -> string list
  84 val B0_pack.list : unit -> t list
  84 val B0_unit.list : unit -> t list
  84 val Stdlib.List.concat : 'a list list -> 'a list
  84 val Stdlib.Option.to_list : 'a option -> 'a list
  85 val Iter.to_list : 'a t -> 'a list
  85 val Stdlib.List.flatten : 'a list list -> 'a list
  85 val Stdlib.Set.Make.elements : t -> elt list
  85 val Topkg.Exts.c_dll_library : ext list
  85 val Ocaml_version.Releases.all : t list
  85 val Ocaml_version.Releases.dev : t list
  86 val Topkg.Exts.real_c_library : ext list

Partial name search:
  $ sherlodoc search --print-cost "strin"
  151 val Stdlib.string_of_int : int -> string
  153 val Stdlib.string_of_bool : bool -> string
  154 val Stdlib.Digest.string : string -> t
  155 val Stdlib.string_of_float : float -> string
  156 val Fmt.string : string t
  160 val Prettym.string : string t
  162 val Bi_io.string_tag : node_tag
  163 val Caqti_type.string : string t
  166 val Metrics.string : string field_f
  166 val Fmt.Dump.string : string t
  167 type Js_of_ocaml.Js.string_array
  168 val Alcotest.string : string testable
  168 val B0_std.Fmt.string : string t
  168 val Num.string_of_num : num -> string
  169 val PPrint.string : string -> document
  169 val Caml.string_of_int : int -> string
  171 val Angstrom.string : string -> string t
  171 val Topkg.Conf.string : string conv
  171 val Caml.string_of_bool : bool -> string
  171 val Stdlib.prerr_string : string -> unit
  171 val Stdlib.print_string : string -> unit
  171 val Bos_setup.Fmt.string : string t
  171 val Stdlib.int_of_string : string -> int
  172 val Bi_io.string_of_tree : tree -> string
  172 val Caqti_type.Std.string : string t
  $ sherlodoc search --print-cost "base strin"
  246 val Base.Sexp.of_string : unit
  251 val Astring.String.Sub.base_string : sub -> string
  252 val Base.Exn.to_string : t -> string
  252 val Base.Sys.max_string_length : int
  254 val Base.Float.to_string : t -> string
  257 val Base.Exn.to_string_mach : t -> string
  257 val Base.Info.to_string_hum : t -> string
  257 val Base.Sign.to_string_hum : t -> string
  258 val Base.Error.to_string_hum : t -> string
  258 val Base.Info.to_string_mach : t -> string
  259 val Base.Error.to_string_mach : t -> string
  262 val Base.Or_error.error_string : string -> _ t
  263 val Alcotest_stdlib_ext.String.Sub.base_string : sub -> string
  264 val Base.Buffer.add_string : t -> string -> unit
  264 val Base.Sign_or_nan.to_string_hum : t -> string
  267 val Base.Sexp.to_string : Sexplib0.Sexp.t -> string
  268 val Base.Info.to_string_hum_deprecated : t -> string
  269 val Base.Error.to_string_hum_deprecated : t -> string
  269 val Base.Float.to_padded_compact_string : t -> string
  269 val Base.Source_code_position.to_string : t -> string
  272 val Base.Sexp.to_string_mach : Sexplib0.Sexp.t -> string
  274 val Base.String.rev : t -> t
  275 val Base.Int.to_string_hum : ?delimiter:char -> t -> string
  277 val Base.String.hash : t -> int
  277 val Base.Int32.to_string_hum : ?delimiter:char -> t -> string

  $ sherlodoc search --print-cost "tring"
  144 type Stdlib.String.t = string
  148 val Stdlib.String.empty : string
  151 val Stdlib.prerr_string : string -> unit
  151 val Stdlib.print_string : string -> unit
  151 val Stdlib.int_of_string : string -> int
  153 val Stdlib.bool_of_string : string -> bool
  154 val Stdlib.Digest.string : string -> t
  155 type Docstrings.docstring
  155 val Stdlib.String.create : int -> bytes
  155 val Stdlib.Unit.to_string : t -> string
  155 val Stdlib.float_of_string : string -> float
  156 val Fmt.string : string t
  156 val Stdlib.String.equal : t -> t -> bool
  156 val Stdlib.Int.to_string : int -> string
  156 val Stdlib.String.length : string -> int
  157 val Stdlib.String.copy : string -> string
  157 val Stdlib.String.trim : string -> string
  157 val Stdlib.String.compare : t -> t -> int
  158 type Astring.String.set
  158 type Astring.String.sub
  158 val Stdlib.String.of_seq : char Seq.t -> t
  158 val Stdlib.String.to_seq : t -> char Seq.t
  158 val Stdlib.Bool.to_string : bool -> string
  159 val Re.whole_string : t -> t
  160 val Stdlib.String.is_valid_utf_8 : t -> bool
  $ sherlodoc search --print-cost "base tring"
  224 val Base.String.rev : t -> t
  226 val Base.Sexp.of_string : unit
  227 val Base.String.hash : t -> int
  228 val Base.String.escaped : t -> t
  228 val Base.String.max_length : int
  229 val Base.String.(^) : t -> t -> t
  230 val Base.String.uppercase : t -> t
  231 val Base.String.capitalize : t -> t
  231 val Astring.String.Sub.base_string : sub -> string
  232 val Base.Exn.to_string : t -> string
  232 val Base.String.append : t -> t -> t
  234 val Base.String.equal : t -> t -> bool
  234 val Base.String.prefix : t -> int -> t
  234 val Base.String.suffix : t -> int -> t
  234 val Base.Float.to_string : t -> string
  235 val Base.String.compare : t -> t -> int
  237 val Base.String.ascending : t -> t -> int
  237 val Base.String.split_lines : t -> t list
  239 val Base.String.drop_prefix : t -> int -> t
  239 val Base.String.drop_suffix : t -> int -> t
  239 val Base.String.common_prefix : t list -> t
  239 val Base.String.common_suffix : t list -> t
  240 val Base.String.to_list_rev : t -> char list
  240 val Base.String.common_prefix2 : t -> t -> t
  240 val Base.String.common_suffix2 : t -> t -> t

