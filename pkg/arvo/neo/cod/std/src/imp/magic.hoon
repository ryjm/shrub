/@  magic
/@  card
/@  card-diff
/@  magic-diff
/-  scryfall
^-  kook:neo
|%
++  poke   (sy %scryfall-req %iris-res %magic-diff %card ~)
++  state  pro/%magic
++  kids
  ^-  kids:neo
  %-  some
  :-  %y
  %-  ~(gas by *lads:neo)
  :~  :-  [&/%t &/%t &/%ta &/%ud |]
      [pro/%card (sy %card-diff %card ~)]
  ==
++  deps  *deps:neo
++  form
  ^-  form:neo
  |_  [=bowl:neo =aeon:neo =pail:neo]
  ++  poke
    |=  [=stud:neo vax=vase]
    ^-  (quip card:neo pail:neo)
    =/  state  !<(magic q.pail)
    ?+    stud  !!
        %magic-diff
      ~&  got-diff/stud
      =+  !<(diff=magic-diff vax)
      ?.  ?=(%fetch-cards -.diff)  `pail
      =/  headers
        :~  ['User-Agent' 'Urbit Client']
            ['Accept' 'application/json']
        ==
      =/  query=@t
          (fall q.diff 'banned:legacy')
      =/  url  %^  cat  3
          'https://api.scryfall.com/cards/search?q='
          %-  crip
          %-  en-urlt:html
          (trip query)
      =/  =request:http
        :*  %'GET'
            url
            headers
            ~
        ==
      ~&  req/request
      =/  =req:iris:neo  [#/cards/[query]/[da/now.bowl] request]
      :_  magic/!>(state(fetching &))
      [#/[p/our.bowl]/$/iris %poke iris-req/!>(req)]~
      ::
        %iris-res
      =+  !<(=res:iris:neo vax)
      ?.  ?=(%finished -.dat.res)
        `pail
      ?~  full-file.dat.res
        `pail
      =/  body=cord  q.data.u.full-file.dat.res
      =/  jon=(unit json)  (de:json:html body)
      ?~  jon  `pail
      =/  res
        %-  mole
        |.  (cards-res:dejs:scryfall u.jon)
      ?~  res  `pail
      :_  magic/!>([| (welp cards.state +.u.res)])
      %+  turn  +.u.res
      |=  car=card
      :-  (welp here.bowl (en-pith:card car))
      [%make %card `card/!>(car) ~]
      ==
  ::
  ++  init
    |=  old=(unit pail:neo)
    ^-  (quip card:neo pail:neo)
    =;  cards  `magic/!>([| cards])
    %+  murn
    ~(tap of:neo kids.bowl)
    |=  [=(pole iota) =idea:neo]
    %-  mole  |.(!<(card q.pail.idea))
  --
--
