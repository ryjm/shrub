/@  card
|%
+$  req
  $%  [%cards-search ~]
  ==
++  dejs
  =,  dejs:format
  |%
  ++  cards-res
    %-  ot
    :~  object+(su (jest 'list'))
        data+(ar card)
    ==
  ++  card
    %-  ou
    :~  name+(un so)
        'mana_cost'^(un so)
        cmc+(un ne)
        'type_line'^(un so)
        'oracle_text'^(uf ~/(mu so))
        power+(uf ~/(mu so))
        toughness+(uf ~/(mu so))
        colors+(uf ~/(ar so))
        'color_identity'^(uf ~/(ar so))
        keywords+(uf ~/(ar so))
        set+(un so)
        'set_name'^(un so)
        'collector_number'^(un so)
        rarity+(un so)
        artist+(un so)
        'image_uris'^(uf ~/(om so))
    ==
  --
--

