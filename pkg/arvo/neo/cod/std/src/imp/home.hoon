/@  home
/*  feather-intro
/*  diary
^-  kook:neo
|%
++  state  pro/%home
++  poke  (sy %home ~)
++  kids
  :-  ~
  :-  %y
  ^-  (map pish:neo lash:neo)
  %-  malt
  :~
    :-  [|/%ta |]
    [pro/%any ~]
  ==
++  deps  *deps:neo
++  form
  ^-  form:neo
  |_  [=bowl:neo =aeon:neo =pail:neo]
  ++  init
    |=  old=(unit pail:neo)
    ^-  (quip card:neo pail:neo)
    :_  home/!>(*home)
    :~  [#/[p/our.bowl]/home/diary %make %diary ~ ~]
        [#/[p/our.bowl]/home/tasks %make %task `task/!>(['' | & ~]) ~]
        [#/[p/our.bowl]/home/sail %make %sail `sail/!>(['# hello world' 'prose p-page mw-page ma' ~]) ~]
        [#/[p/our.bowl]/home/accel %make %accel ~ ~]
        [#/[p/our.bowl]/home/circle %make %circle ~ ~]
        [#/[p/our.bowl]/home/files %make %folder ~ ~]
        [#/[p/our.bowl]/home/planner %make %planner ~ ~]
        [#/[p/our.bowl]/home/messenger %make %messenger ~ ~]
        ::
        [#/[p/our.bowl]/home/docs %make %folder `folder/!>([%introduction %tutorials %guides ~]) ~]
        ::
        [#/[p/our.bowl]/home/docs/tutorials %make %folder `folder/!>([%counter %diary %messenger %tasks ~]) ~]
        [#/[p/our.bowl]/home/docs/tutorials/diary %make %sail `sail/!>([diary 'prose p-page mw-page ma' ~]) ~]
        ::
        [#/[p/our.bowl]/home/docs/guides %make %folder `folder/!>([%feather ~]) ~]
        [#/[p/our.bowl]/home/docs/guides/feather %make %sail `sail/!>([feather-intro 'prose p-page mw-page ma' ~]) ~]
    ==
  ++  poke
    |=  =pail:neo
    ^-  (quip card:neo pail:neo)
    ?+    p.pail  !!
        %home
      [~ pail]
    ==
  --
--
