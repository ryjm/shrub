/@  card
/@  card-diff
^-  kook:neo
|%
++  state  only/%card
++  poke   (sy %card-diff %card ~)
++  kids   *kids:neo
++  deps   *deps:neo
++  form
  ^-  form:neo
  |_  [=bowl:neo =aeon:neo =pail:neo]
  ++  init
    |=  old=(unit pail:neo)
    ^-  (quip card:neo pail:neo)
    ?^  old  
      ::  =+  !<(=card q.u.old)
      ::  :_  u.old
      ::  :_  ~
      ::  :-  (welp here:bowl ~)
      ::  ~&  init/card
      `card/q.u.old
    `card/!>(*card)
  ++  poke
    |=  [=stud:neo vax=vase]
    ^-  (quip card:neo pail:neo)
    =/  state  !<(card q.pail)
    ?>  =(our ship.src):bowl
    ?:  =(%card stud)
      ~&  poke/!<(card vax)
      `card/!>(!<(card vax))
    ?>  =(%card-diff stud)
    =/  act    !<(card-diff vax)
    ?-    -.act
        %update
      :-  ~
      :-  %card
      !>  
      %=  state
        name  name.act
        mana-cost  mana-cost.act
        type-line  type-line.act
        oracle-text  oracle-text.act
        power  power.act
        toughness  toughness.act
      ==
    ==
  --
--
