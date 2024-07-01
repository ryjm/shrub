/@  node
/@  magic-diff
/-  manx-utils
:-  [%node %$ %magic-diff]
|=  nod=node
^-  magic-diff
=/  mu  ~(. manx-utils nod)
=/  head  (@tas (got:mu %head))
=/  query  (@tas (got:mu %head))
~&  query
?+    head  !!
    %fetch-cards
  =/  query  (bind (val:mu "query") crip)
  [%fetch-cards query]
==
