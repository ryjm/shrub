/@  quiz-diff
/-  feather-icons
:-  [%quiz-diff %$ %htmx]
|=  diff=quiz-diff
|=  =bowl:neo
^-  manx
~&  >>  flash/diff
;div.loading
  =hx-get  "/neo/sky"
  =hx-params  "none"
  =hx-indicator  "closest .loader"
  =hx-target  "#air"
  =hx-select  "#air"
  =hx-swap  "outerHTML"

  =hx-trigger  "load once"
  ;+  loading.feather-icons
==
