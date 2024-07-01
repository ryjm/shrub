/@  card
/-  feather-icons
:-  [%card %$ %htmx]
|=  =card
|=  =bowl:neo
^-  manx
|^
;div
  ;+  style
  ;+  (card-item card)
==
::
++  card-item
  |=  c=_card
  ^-  manx
  ;div.card.b1.br2.shadow-lg.transition-all.duration-300.hover-shadow-xl.relative
    ;div.g3.fr
      ;div.card-image.hidden.p2.bd2.jc
        ;img.hf.wf
          =src  "{(trip (~(gut by images.c) 'normal' ''))}"
          =alt  "{(trip name.c)}"
          ;
        ==
      ==
      ;div.card-content.fc.ac.p-2
        ;div.fr.ja
          ;div.br1.b2.o3.p2
            ;h2.bold.mb-1: {(trip name.c)}
          ==
        ==
        ;div.b2.p-3.shadow-inner.mt1
          ;div.s-1.mono: {(trip (fall oracle-text.c ''))}
        ==
        ;div.fr.jb.mt1.g3
          ;p
            =class   "p-1 tc b4 {(trip ?:(=('' mana-cost.c) 'hidden' ''))}"  
            ;span.mono: {(trip mana-cost.c)}
          ==
          ;div.b-1.b3.p1.tc.o5
            ;span.mono: {(trip type-line.c)}
          ==
          ;+  ?~  power.c  ;span;
              ?~  toughness.c  ;span;
              ;p.p-1.b-2.text-right
                ;span.mono: {(trip u.power.c)}/{(trip u.toughness.c)}
              ==
        ==
      ==
    ==
  ==
++  style
  ^-  manx
  ;style
    ;+  ;/
    %-  trip
    '''
    .card { transition: all 0.3s ease; position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
    .card:hover { transform: scale(1.1); }
    .card:hover .card-image { display: block !important; width: 100%; height: 100%; object-fit: cover; z-index: 20; }
    .shadow-lg { box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05); }
    .hover-shadow-xl:hover { box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04); }
    .transition-all { transition-property: all; }
    .transition-opacity { transition-property: opacity; }
    .duration-300 { transition-duration: 300ms; }
    .shadow-inner { box-shadow: inset 0 2px 4px 0 rgba(0, 0, 0, 0.06); }
    .relative { position: relative; }
    .absolute { position: absolute; }
    .inset-0 { top: 0; right: 0; bottom: 0; left: 0; }
    .hover-opacity-100:hover { opacity: 1; }
    '''
  ==
--
