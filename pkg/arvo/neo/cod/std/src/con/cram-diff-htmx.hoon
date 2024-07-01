/@  cram-diff
/-  feather-icons
:-  [%cram-diff %$ %htmx]
|=  diff=cram-diff
|=  =bowl:neo
^-  manx
~&  >>  flash-cram/diff
~&  >>  flash-cram/here.bowl
;div.loading
  =hx-get  "/hawk{(en-tape:pith:neo here.bowl)}"
  =hx-indicator  "closest .loader"
  =hx-target  ".loader"
  =hx-select  "this"
  =hx-swap  "morph"
  =hx-trigger  "load"
  ;+  loading.feather-icons
==
