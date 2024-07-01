/@  quiz
/-  html-utils
/-  manx-utils
/-  feather-icons
|%
++  spit-all
  |=  craw=tape
  ^-  (list tape)
  (split craw ">>>")
::
++  split-card
  |=  card=tape
  ^-  [tape tape]
  =/  parts  (split card "---")
  ?~  parts  ["" ""]
  ?~  t.parts  [i.parts ""]
  [i.parts (welp "---" (zing t.parts))]
::
++  make-all
  |=  craw=tape
  ^-  (each (list quiz) tang)
  =/  cards  (spit-all craw)
  =/  result  *(list quiz)
  =/  errors  *tang
  |-
  ?~  cards
    ?:  =(0 (lent errors))
      [%.y (flop result)]
    [%.n (flop errors)]
  =/  [fore=tape back=tape]  (split-card i.cards)
  =/  attempt  (make-quiz fore back)
  ?-  -.attempt
    %.y  $(cards t.cards, result [p.attempt result])
    %.n  $(cards t.cards, errors [(crip "Error in card {<(lent result)>}: {<p.attempt>}") errors])
  ==
++  error
|=  =tang
^-  manx
;div.pre.mono.p2
  ;*
  %+  turn  (scag 25 tang)
  |=  =tank
  ;span: {(of-wall:format (~(win re tank) 0 80))}
==
++  make-quiz
  |=  [fore=tape back=tape]
  ^-  (each quiz tang)
  ?:  &(=('' fore) =('' back))
    [%.n ~['empty quiz']]
  =/  view
    %-  some
    %-  render-quiz
    %-  crip
    """
    {fore}
    ---
    {back}
    """
  :-  %.y
  :*  (crip fore)
      (crip back)
      %both
      view
      %.n
     *learned:quiz
  ==
::
++  split
  |=  [text=tape sep=tape]
  ^-  (list tape)
  ?:  =(text "")  ~[text]
  =/  [pre=tape suf=tape]  (split-at text sep)
  ?~  suf
    ;;  (list tape)
    ~[text]
  =/  post=tape  (slag (lent sep) `tape`suf)
  [pre $(text post)]
::
++  split-at
  |=  [hay=tape nedl=tape]
  ^-  [tape tape]
  =/  i  0
  |-  ^-  [tape tape]
  ?:  |(=(i (lent hay)) (gth (add i (lent nedl)) (lent hay)))
    [hay ~]
  ?:  =(nedl (scag (lent nedl) (slag i hay)))
    [(scag i hay) (slag i hay)]
  $(i +(i))
::
++  extract-text
  |=  =manx
  ^-  @t
  =/  mu  ~(. manx-utils manx)
  %-  crip
  %-  zing
  %+  turn  pre-get-text:mu
  |=(t=tape (weld t "\0a"))
::
++  render-quiz
  =|  bol=bowl:neo
  |=  code=@t
  ^-  $+(show show:quiz)
  =/  newline  (trip 10)
  =/  udon
    :: format as udon document
    %-  crip
    ;:  welp
      ";>"  newline
      (trip code)  newline
    ==
  =/  mul
    %-  mule
    |.
    !<  manx
    %+  slap
      %+  with-faces:ford:neo  (slop !>(neo) !>(..zuse))
      :~
        :: htmx/!>(htmx)
        bowl/!>(bol)
        feather-icons/!>(feather-icons)
      ==
    (ream udon)
  ?-  -.mul
    %.y  `show:quiz`[%.y `[manx manx]`(split-quiz (manx p.mul))]
    %.n  [%.n (tang p.mul)]
  ==
::
++  to-fore-back
  |=  [front=manx back=manx]
  =/  f  ~(. manx-utils front)
  =/  b  ~(. manx-utils back)
  =/  fr
    %-  crip
    %-  zing
    %+  turn  pre-get-text:f
    |=(t=tape (weld t " "))
  =/  ba
    %-  crip
    %-  zing
    %+  turn  pre-get-text:b
    |=(t=tape (weld t " "))
   [fr ba]

++  split-quiz
  |=  doc=manx
  ^-  [manx manx]
  =/  seps=(list [=path =manx])
    %-  ~(wic mx:html-utils doc)
    |=  [=path =manx]
    =(n.g.manx %hr)
  ?~  seps
    :: If no separator found, treat all as front
    [doc ;div;]
  =/  ind  (slav %ud (head path:(head seps)))
  :-  ;div
    ;*  (scag ind c.doc)
  ==
  ;div
    ;*  (slag +(ind) c.doc)
  ==
--
