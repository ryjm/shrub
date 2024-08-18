/@  node
/@  quiz
/-  manx-utils
/-  ql=quiz
:-  [%node %$ %quiz]
|=  nod=node
^-  quiz
=/  mu  ~(. manx-utils nod)
=/  fore  (vol:mu "fore")
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
=/  res  (make-quiz:ql (trip fore) (trip back))
 %-  (slog leaf/"built" (sell !>(p.res)) ~)
?-    -.res
    %.y
  `quiz`p.res
  %.n  *quiz   
==
