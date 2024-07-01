/@  node        ::  manx
/@  quiz-diff   ::  ?([%add-card front=@t back=@t] [%remove-card id=@da] [%flip-card id=@da] [%mode =mode])
/-  manx-utils
:-  [%node %$ %quiz-diff]
|=  nod=node
^-  quiz-diff
~&  quiz-diff/nod
=/  mu  ~(. manx-utils nod)
=/  head  (@tas (got:mu %head))
?+    head  ~|([%unknown-head head] !!)
    %add
  =/  q  (vol:mu "front")
  =/  a  (vol:mu "back")
  :-  %add
  :*  front=q
      back=a
  ==
    %mode
=/  mode
  %+  snag  0
  %+  murn  c.nod
  |=  =manx
  =/  ribs  (malt a.g.manx)
  =/  cls  (fall (~(get by ribs) %class) "")
  ?~  x=(find "toggled" cls)  ~
  :-  ~
  (crip (~(got by ribs) %mode))
  ?.  ?=(?(%edit %both %preview %study) mode)
    ~|([%invalid-mode mode] !!)
  [%mode mode]
==
