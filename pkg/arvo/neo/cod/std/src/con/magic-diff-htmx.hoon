/@  magic-diff
/-  feather-icons
:-  [%magic-diff %$ %htmx]
|=  t=magic-diff
|=  =bowl:neo
^-  manx
;div.loading
  =hx-get        "/hawk{(en-tape:pith:neo here.bowl)}"
  =hx-target     "closest .hawk"
  =hx-indicator  "closest .loader"
  =hx-swap       "innerHTML"
  ;span.loading
  ;+  loading.feather-icons
  ==
==
