/@  node
/@  cram
/-  manx-utils
/-  ql=quiz
:-  [%node %$ %cram]
|=  nod=node
^-  cram
=/  mu  ~(. manx-utils nod)
~&  nod
=/  mode  (bind (get:mu %mode) mode:cram)
=/  craw
 =/  raw=tape  
   ~|  "no craw found in {<nod>}"
   (need (val:mu "craw"))
 %-  crip
 ?:  =((lent raw) 0)  raw
 ?.  =((rear raw) '\0a')  raw
 (snip raw)
=/  view  (render-quiz:ql craw)
=/  res
  ?-  -.view
    %.n  ~
    %.y  `view
  ==
=/  clas  (vol:mu "clas")
=/  exam  (got:mu %exam)
=/  id  (got:mu %id)
:*  craw
    clas
    (slav %ud exam)
    (slav %ud id)
    (fall mode %bulk)
    res
    ~
==
