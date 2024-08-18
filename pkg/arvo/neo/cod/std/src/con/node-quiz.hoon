/@  node
/@  quiz
/-  manx-utils
/-  ql=quiz
:-  [%node %$ %quiz]
|=  nod=node
^-  quiz
~&  >>>  node/nod
=/  mu  ~(. manx-utils nod)
=/  fore  (vol:mu "fore")
~&  >>  node/fore
=/  back  (vol:mu "back")
::  =/  mode
::    %+  snag  0
::    %+  murn  c.nod
::    |=  =manx
::    =/  ribs  (malt a.g.manx)
::    =/  cls  (fall (~(get by ribs) %class) "")
::    ?~  x=(find "toggled" cls)  ~
::    :-  ~
::    ;;  mode:quiz
::    (crip (~(got by ribs) %mode))
~&  >>  node/back
=/  res  (make-quiz:ql (trip fore) (trip back))
 %-  (slog leaf/"built" (sell !>(p.res)) ~)
~&  >>  node/res
?-    -.res
    %.y
  `quiz`p.res
  %.n  *quiz   
==
