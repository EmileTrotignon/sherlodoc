  $ ocamlc -c main.mli -bin-annot -I .
  $ odoc compile -I . main.cmti
  $ odoc link -I . main.odoc
  $ cat $(find . -name '*.odocl') > megaodocl
  $ du -sh megaodocl
  4.0K	megaodocl
  $ sherlodoc_index --format=marshal --db=db.bin $(find . -name '*.odocl')
  Indexing in 0.000085s
  $ export SHERLODOC_DB=db.bin
  $ sherlodoc --print-cost "list"
  [No results]
  $ sherlodoc ":moo"
  val Main.v : moo
  $ sherlodoc ":mo"
  val Main.v : moo
