/@  quiz
/@  quiz-diff
^-  kook:neo
|%
++  state
  ^-  curb:neo
  [%pro %quiz]
++  poke
  ^-  (set stud:neo)
  (sy %quiz-diff %quiz ~)
++  kids  *kids:neo
++  deps
  ^-  deps:neo
  *deps:neo
++  form
  ^-  form:neo
  |_  [=bowl:neo =aeon:neo =pail:neo]
  ++  init
    |=  pil=(unit pail:neo)
    ^-  (quip card:neo pail:neo)
    %-  some
    ?^  pil
      u.pil
    =;  quiz  
      ~&  >>  init/fore.quiz  
      quiz/!>(quiz)
    ?~  res=(mole |.(!<(quiz q.pail)))
      ~&  >>  init/[failed/q.pail]
      *quiz
    u.res
  ++  poke
    |=  [=stud:neo vax=vase]
    ^-  (quip card:neo pail:neo)
    ?>  =(our ship.src):bowl
    =/  state
      ?~  res=(mole |.(!<(quiz q.pail)))
        *quiz
      u.res
    ~&  bowl/bowl
    ~&  state/state
    ?:  =(%quiz stud)
      %-  some
      ?~  res=(mole |.(!<(quiz vax)))
        %-  (slog leaf/"failed" (sell vax) ~)
        ~&  >>  %poke-failed
        quiz/!>(state)
      ~&  >>  poke/u.res
      quiz/!>(u.res)
    ?>  =(%quiz-diff stud)
    =/  act    !<(quiz-diff vax)
    ?+    -.act  ~|("unsupported action" !!)
        %remove
      :_  quiz/!>(state)
      :~  :-  (welp here.bowl ~)
          [%cull ~]
      ==
    ::
        %update
      =/  updated-quiz  state(fore fore.act, back back.act)
      ~&  quiz/here.bowl
      :_  quiz/!>(updated-quiz)
      :~  :-  (welp here.bowl ~)
          [%make %quiz `quiz/!>(updated-quiz) ~]
      ==
    ::
        %mode
      `quiz/!>(state(mode mode.act))
    ==
  --
--
