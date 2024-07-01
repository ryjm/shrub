=<  card
|%
+$  card
  $:  name=@t
      mana-cost=@t
      cmc=@rd
      type-line=@t
      oracle-text=(unit @t)
      power=(unit @t)
      toughness=(unit @t)
      colors=(list @t)
      color-identity=(list @t)
      keywords=(list @t)
      set=@t
      set-name=@t
      collector-number=@t
      rarity=@t
      artist=@t
      images=(map @t @t)
    ==
::
++  en-pith
  |=  car=card
  ^-  pith
  =/  name  (:(cork trip cass crip) name.car)
  [set.car rarity.car name collector-number.car ~]
::
++  en-tape
  |=  car=card
  (spud (pout (en-pith car)))
::
++  en-path
  |=  car=card
  (pout (en-pith car)) 
::
--

