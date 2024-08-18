/@  quiz
/@  cram
/@  cram-diff
/-  ql=quiz
::
^-  kook:neo
=>
|%
++  assign-name
  |=  =bowl:neo
  ?:  =([~ ~] kids.bowl)  1
  =/  sorted-names=(list @ud)
    %-  sort  :_  lth
    %+  turn  ~(tap by ~(tar of:neo kids.bowl))
      |=  [=pith:neo =idea:neo]
      +:(,[%ud @ud] (rear pith))
  =/  last-name=@ud  (rear sorted-names)
  =/  name-missing=(list @ud)
    %+  skim  (gulf 0 last-name)
    |=  n=@ud
    =(~ (find ~[n] sorted-names))
  ?~  name-missing  +(last-name)
  (rear name-missing)
::
++  get
  |=  [=bowl:neo exam=@ud id=@ud]
  ^-  quiz
  =/  pit=pith:neo
    #/exam/[ud/exam]/quiz/[ud/id]
  ~&  >>  "looking for quiz at {<pit>}"
  =/  kid  (~(get of:neo kids.bowl) pit)
  ?~  kid
    ~&  >>  "no quiz found"
    !!
  !<(quiz q.q.saga:u.kid)
::
++  learn
  |=  [=bowl:neo q=quiz =recall-grade:quiz]
  |^
  ^-  learned:quiz
  =/  ease=@rs  (next-ease learned.q)
  =/  box=@  (next-box learned.q)
  =/  interval=@dr  (next-interval [ease box learned.q])
  [ease interval box]
  ::
  ++  next-ease
    |=  =learned:quiz
    ^-  @rs
    =/  ease-changes=(map recall-grade:quiz @rs)
      %-  malt
      ^-  (list [recall-grade:quiz @rs])
      :~  [%again .-0.3]
          [%hard .-0.15]
          [%good .0]
          [%easy .0.15]
      ==
    =/  ease-min=@rs  .1.3
    =/  ease-max=@rs  .5.0
    ?:  (lth box.learned 2)
      ease.learned
    =/  chg  (~(got by ease-changes) recall-grade)
    =/  a  (add:rs ease.learned chg)
    ?:  (gte a ease-min)
      a
    ?:  (gte a ease-max)
      ease-max
    ease-min
  ::
  ++  next-box
    |=  =learned:quiz
    ^-  @
    ?:  ?&  =(recall-grade %easy)
            =(box.learned 0)
        ==
      2
    ?:  =(recall-grade %again)  0
    (add box.learned 1)
  ::
  ++  next-interval
    |=  [next-ease=@rs next-box=@ =learned:quiz]
    ^-  @dr
    =/  fixed-intervals=(list @dr)  [~s5 ~m15 ~d1 ~d6 ~]
    ?:  (lth next-box (lent fixed-intervals))
      (snag next-box fixed-intervals)
    (interval-fuzz interval.learned next-ease)
  ::
  ++  interval-fuzz
    |=  [interval=@dr next-ease=@rs]
    ^-  @dr
    =/  random  ~(. og eny.bowl)
    =/  interval-rs  (time-to-rs interval)
    =/  r=@rs  (add:rs `@rs`.0.9 (rad:random .1.1))
    =/  fuzzed  (mul:rs (mul:rs next-ease interval-rs) r)
    (rs-to-time fuzzed)
  ::
  ++  time-to-atom
    |=  time=@d
    ^-  @
    (yule (yell time))
  ::
  ++  time-to-rs
    |=  time=@d
    ^-  @rs
    (sun:rs (time-to-atom time))
  ::
  ++  rs-to-time
    |=  time=@rs
    ^-  @dr
    (abs:si (need (toi:rs time)))
  ::
  --
--
::
|%
::
++  state
  ^-  curb:neo
  [%pro %cram]
::
++  poke
  ^-  (set stud:neo)
  (sy %cram-diff %cram ~)
::
++  kids
  ::
  ^-  kids:neo
  %-  some
  :-  %y
  %-  ~(gas by *lads:neo)
  :~  :-  ::
        [&/%exam |/%ud &/%quiz |/%ud |]
      ::
      [[%pro %quiz] (sy %quiz-diff %quiz ~)]
  ==
::
++  deps
  ^-  deps:neo
  *deps:neo
::
++  form
  ^-  form:neo
  |_  [=bowl:neo =aeon:neo =pail:neo]
  ::
  ++  init
    |=  old=(unit pail:neo)
    ^-  (quip card:neo pail:neo)
    %-  some
    =;  cram  cram/!>(cram)
    ?^  old  
      ?~  ole=(mole |.(!<(cram q.u.old)))
        *cram
      u.ole
    ?~  res=(mole |.(!<(cram q.pail)))
      *cram
    u.res
  ::
  ++  poke
    |=  [=stud:neo vax=vase]
    ^-  (quip card:neo pail:neo)
    =/  state  !<(cram q.pail)
    ?:  =(stud %cram)
      =/  new  !<(cram vax)
      =/  =pail:neo
        :-  %cram-diff
        !>  sync/craw.new
      ~&  >>  new+new
      :_  cram/!>(state(craw craw.new))
      :~  :-  (welp here.bowl ~)
          :*  %poke
              pail
          ==
    ==
    ?>  =(%cram-diff stud)
    =/  act    !<(cram-diff vax)
    ::
    ?>  =(our ship.src):bowl
    ?-    -.act
      %delete
    =/  kath=pith:neo
      %+  welp
        here.bowl
      #/exam/[ud/exam.state]/quiz/[ud/id.state]
    =/  =pail:neo
      :-  %quiz-diff
      !>  remove-card/id.state
    :_  cram/!>(state)
    :~
      :-  %+  welp
             here.bowl
          #/exam/[ud/exam.state]/quiz/[ud/id.state]
      :*  %poke
          pail
      ==
      :-  %+  welp
             here.bowl
          #/exam/[ud/exam.state]/quiz/[ud/id.state]
      [%cull ~]
    ==
      %reset  !!
      %new
    =/  new-id=@ud  (assign-name bowl)
    =/  new-quiz=quiz  [fore='front' back='back' mode=%both ~ | *learned:quiz]
    =/  =pail:neo
      :-  %cram-diff
      !>  sync/craw.act
    :_  cram/!>(state(craw craw.act, exam new-id))
    :~  :-  (welp here.bowl ~)
        :*  %poke
            pail
        ==
    ==
        %sync
      =|  newb=bowl:neo
      =/  render  render-quiz:ql
      =.  here.newb  here.bowl
      =.  bol.render  newb
      =/  rendered  (render craw.act) 
      ~&  >>  "rendered: {<rendered>}"
      ?-    -.rendered
          %.n
         ~&  >>>  "failed to render"
        `cram/!>(state(craw craw.act))
        ::
          %.y
        =/  all  (make-all:ql (trip craw.act))
        =/  cards=(list card:neo)
          ?-    -.all
              %.n
            ~&  >>>  "failed to make all"
            ~
              %.y
            =;  res  -.res
            %+  roll  p.all
            |=  [=quiz [cards=(list card:neo) sub=@ud]]
            ^-  [(list card:neo) @ud]
            =/  =pith:neo
              %+  welp  here.bowl
              #/exam/[ud/exam.state]/quiz/[ud/sub]
            ~&  >  "making quiz: {<pith>}"
            =/  card  [pith [%make %quiz `quiz/!>(quiz) ~]]
            :_  +(sub)
            [card cards]
          ==
        :-  cards 
        cram/!>(state(craw craw.act))
      ==
    ::
        %mode
      :_  cram/!>(state(mode mode.act))
      ~
    ::
        %exam
      ~&  >>  "exam: {<current.act>}"
      :_  cram/!>(state(exam current.act, id id.act))
      ~
      ::  :~  :-  %+  welp  here.bowl
      ::          #/exam/[ud/current.act]/quiz/[ud/id.act]
      ::      :*  %make
      ::          %quiz
      ::          `[%quiz !>(q)]
      ::          ~
      ::      ==
      ::    ==
      ::
        %quiz
      :_  cram/!>(state)
      =/  =pith:neo
        %+  welp  here.bowl
        #/exam/[ud/exam.state]/quiz/[ud/id.state]
      :~  :-  pith
          :*  %make
              %quiz
              `[%quiz !>(quiz.act)]
              ~
          ==
      ==
      ::
        %grade
      =/  =quiz  (get bowl exam.state id.state)
      =.  learned.quiz
        (learn bowl quiz recall-grade.act)
      =/  =pith:neo
        %+  welp  here.bowl
        #/exam/[ud/exam.state]/quiz/[ud/id.state]
      :_  cram/!>(state)
      :~  :-  pith
          :*  %make
              %quiz
              `[%quiz !>(quiz)]
              ~
          ==
      ==
    ==
  --
--
