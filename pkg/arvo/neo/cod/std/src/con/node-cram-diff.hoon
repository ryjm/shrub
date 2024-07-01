/@  node
/@  cram-diff
/@  cram
/@  quiz
/-  manx-utils
/-  ql=quiz
:-  [%node %$ %cram-diff]
|=  nod=node
^-  cram-diff
=/  mu  ~(. manx-utils nod)
=/  head=@tas  (slav %tas (got:mu %head))
~&  >>  head
?+    head  !!
    %delete
  [%delete ~]
    %sync
  =/  craw  (need (named:mu "craw"))
  ::  =/  clas  (vol:mu "clas")
  ::  =/  exam  (got:mu %exam)
  ::  =/  id  (got:mu %id)
  =/  text  (~(got manx-utils craw) %value)
  [%sync text]
::
    %mode
   =-  ~&  >>  -  -
  ;;  $>(%mode cram-diff)
  =-  ~&  >>  -  -
  :-  %mode
  %+  slav  %tas 
  =-  ~&  >>  -  -
  %+  snag  0
  %+  murn  c.nod
  |=  =manx
  =/  ribs  (malt a.g.manx)
  =/  cls  (fall (~(get by ribs) %class) "")
  ?~  x=(find "toggled" cls)  ~
  :-  ~
  (crip (~(got by ribs) %mode))
::
    %exam
  =/  exam  (slav %ud (got:mu %current))
  =/  id  (slav %ud (got:mu %current-id))
  [%exam exam id]
::
    %quiz
  ::
  =/  fore  (got:mu %fore)
  =/  back  (got:mu %back)
  =/  craw  (got:mu %craw)
  =/  view  `(render-quiz:ql craw)
  =/  =quiz  [fore back %both view | *learned:quiz]
  [%quiz quiz]
    %new
    ~&  >>  nod
  =/  craw  (got:mu %craw)
  [%new craw]
==
