/@  print
/>  htmx
:-  [%print %$ %htmx]
|=  print
|=  =bowl:neo
;div
  ;hr;
  ;h3: Docs
  ;br;
  ;pre
    =style  "max-height: 200px"
    ;+
    =/  turms=(list term)  ;;  (list term)  ?@(terms ~[terms] terms)
    =/  =tang  (show-tang:dprint:neo turms (fall sut -:!>(neo)))
    ::
    %-  (slog tang)
    ((htmx tang/!>(tang)) bowl)
  ==
==
