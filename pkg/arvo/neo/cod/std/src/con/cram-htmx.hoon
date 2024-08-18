/@  cram
/@  quiz
/@  htmx
/-  ql=quiz
/-  feather-icons
:-  [%cram %$ %htmx]
|=  =cram
|=  =bowl:neo
|^
  ^-  manx
  ;div.cram.fc.relative.wf.hf
    =hx-on-cram-refresh  "$(this).find('.refresher').emit('refresh');"
    ;+  (refresher bowl)
    ;+  controls
    ;div.frw.js.af.scroll-y.hf
      ;+  editor
      ;+  previewer
      ;+  deck
      ;+  items
    ==
    ;+  script
    ;+  style
  ==
++  refresher
  |=  =bowl:neo
  ;div.absolute.hidden
    =style  "top: 1em; left: 1em;"
    ;div.loader.refresher
      =hx-get  "{(en-tape:pith:neo :(weld /hawk here.bowl))}?no-save"
      =hx-trigger  "refresh"
      =hx-target  "closest .cram"
      =hx-select  ".cram"
      =hx-swap  "morph"
      ;span.loaded;
      ;span.loading
        ;+  loading.feather-icons
      ==
    ==
  ==
++  spinner
  ;div#spinner.b1.loader.p1.s-2.f2
    ;span.loaded: saved
    ;span.loading: ---
  ==
++  controls
  =/  cls  "p-1 br1 b1 hover"
  ;form.p2.frw.js.ac.g3.sticky.wf
    =style  "top:0; left: 0;"
    =hx-post  "/hawk{(en-tape:pith:neo here.bowl)}?stud=cram-diff"
    =hx-on-htmx-after-request  "$(this).emit('cram-refresh');"
    =morph-retain  "class"
    =hx-swap  "none"
    =head  "mode"
    ;button.p2.b1.br1.bd1.hover.loader
      =type  "button"
      =hx-post  "/hawk{(en-tape:pith:neo here.bowl)}?stud=cram-diff"
      =morph-retain  "class"
      =craw  "{(trip craw.cram)}"
      =head  "new"
      ;span.loaded
        ;+  add.feather-icons
      ==
      ;span.loading
        ;+  loading.feather-icons
      ==
    ==
    ;button
      =class  "{cls} {(trip ?:(=(%bulk mode.cram) 'toggled' ''))}"
      =morph-retain  "class"
      =type  "submit"
      =onclick  "cramChangeMode(this, ['.cram-editor'])"
      =mode  "bulk"
      ; bulk
    ==
    ;button
      =class  "{cls} {(trip ?:(=(%all mode.cram) 'toggled' ''))}"
      =morph-retain  "class"
      =type  "submit"
      =onclick  "cramChangeMode(this, ['.cram-item'])"
      =mode  "all"
      ; all
    ==
    on
    ;button
      =class  "{cls} {(trip ?:(=(%list mode.cram) 'toggled' ''))}"
      =morph-retain  "class"
      =type  "submit"
      =onclick  "cramChangeMode(this, ['.cram-previewer'])"
      =mode  "list"
      ; list
    ==
    ;div.grow;
    ;button
      =class  "{cls} {(trip ?:(=(%study mode.cram) 'toggled' ''))}"
      =morph-retain  "class"
      =type  "submit"
      =onclick  "cramChangeMode(this, ['.deck'])"
      =mode  "study"
      ; study
    ==
  ==
  ::
  ++  editor
    =/  open  =(%bulk mode.cram)
    =/  hid  ?:(open "" "hidden")
    =/  save  |=(from=tape ?:(!=(%bulk mode.cram) "input changed delay:0.4s from:find {from}," ""))
    ;div
      =class  "cram-editor cram-tab {hid} basis-half grow fc"
      =morph-retain  "class"
      ;form
        =class  "fc p1 g1 scroll-y relative grow"
        =style  "min-width: 300px; height: 100%;"
        =hx-post  "/hawk{(en-tape:pith:neo here.bowl)}?stud=cram"
        =hx-swap  "morph"
        =hx-target  "closest .cram"
        =hx-select  ".cram"
        =hx-trigger  "{(save "textarea")} {(save "input")} click from:[name='save']"
        =exam  (scow %ud exam.cram)
        =id    (scow %ud id.cram)
        =head  "sync"
        ;input.p2.mono.bd1.br1
          =name  "clas"
          =placeholder  "prose p3"
          =type  "text"
          =autocomplete  "off"
          =value  (trip clas.cram)
          =oninput  "$(this).attr('value', this.value);"
          ;
        ==
        ;input.p2.mono.bd1.br1.b4
          =name  "shrub"
          =placeholder  "pro/%sail"
          =type  "text"
          =autocomplete  "off"
          =oninput  "$(this).attr('value', this.value);"
          ;
        ==
        ;textarea.p-page.pre.mono.scroll-x.grow.bd1.m0.br1
          =name  "craw"
          =morph-no-swap  ""
          =oninput  "this.setAttribute('value', this.value);"
          =spellcheck  "false"
          =value  (trip craw.cram)
          =placeholder
            """
            # front 1

            ---

            back 1

            >>>

            # front 2

            ---

            back 2
            """
          ; {(trip craw.cram)}
        ==
        ;button
          =class  "p-1 br1 b1 hover"
          =name  "save"
          =type  "submit"
          ; save
        ==
        ;div.absolute
          =style  "top: 11px; right: 11px;"
          ;div.loader
            ;span.loaded(style "opacity: 0;"): ---
            ;span.loading
              ;+  loading.feather-icons
            ==
          ==
        ==
      ==
    ==
::
++  items
  =/  open    =(%all mode.cram)
  =/  show  ?:(open "" "hidden")
  ;div
    =class  "cram-item cram-tab grow hf basis-half br1 scroll-x scroll-y {show}"
    =morph-retain  "class"
    ;*
    %+  murn
      ~(tap of:neo kids.bowl)
    |=  [=(pole iota) =idea:neo]
    =/  kid=bowl:neo  bowl
    =.  kids.kid  [~ ~]
    =.  here.kid  (welp here.bowl pole)
    =.  deps.kid  ~
    ?.  ?=([%exam [%ud e=@ud] %quiz [%ud q=@ud] *] pole)
      ~
    %-  some
    =/  hid  ?:(?&(open =(exam.cram e.pole)) "" "hidden")
    ;div.basis-half.shrink-0.grow.bd1.item
      =class  "quiz-item {hid}"
      =hx-swap  "none"
      =style  "min-width: 350px; min-height: 150px;"
      =hx-post  "/hawk{(en-tape:pith:neo here.bowl)}?stud=cram-diff"
      =morph-retain   "class"
      =hx-trigger  "cram-change"
      =head  "exam"
      =current  "{<e.pole>}"
      =current-id  "{<q.pole>}"
      ;+  %^  add-attr  %onclick
          """
          $(this).emit('cram-change');
          """
      ~!  q.pail.idea
      (!<(htmx q.pail.idea) kid)
    ==
  ==
::
++  item
  |=  [exam=@ id=@]
  =/  pax=pith:neo  #/exam/[ud/exam]/id/[ud/id]
  =/  kid=bowl:neo  bowl
  =.  kids.kid  [~ ~]
  =.  here.kid  (welp here.bowl pax)
  =.  deps.kid  ~
  ;div.basis-half.shrink-0.grow.bd1
    =style  "min-width: 350px; min-height: 150px;"
    ;+
    ?~  res=(~(get of:neo kids.bowl) pax)
      ;div: none - quiz {<[exam id]>}
    ~!  q.pail.u.res
    (!<(htmx q.pail.u.res) kid)
  ==
++  render-quiz-content
  |=  [=view:quiz is-front=? fallback=@t]
  ^-  manx
  ?~  view
    ;div: {(trip fallback)}
  ?-  -.u.view
      %.y
    ?:(is-front p.p.u.view q.p.u.view)
      %.n
    ;div: {<p.u.view>}
  ==
++  previewer
  =/  open  =(%list mode.cram)
  =/  hid  ?:(open "" "hidden")
  ;main
    =class  "cram-previewer cram-tab grow hf basis-half scroll-x scroll-y br1 {hid}"
    =style  "min-width: 300px;"
    =morph-retain  "class"
    ;div.p-page
      ;*
      %+  turn
        ~(tap of:neo kids.bowl)
      |=  [=pith:neo =idea:neo]
      =/  =quiz
        ?:  =(%sig p.q.saga.idea)  *quiz
        !<(quiz q.q.saga.idea)
      =/  exam  (trip (snag 1 (pout pith)))
      =/  id  (trip (snag 3 (pout pith)))
      =/  craw=@t
        %-  crip
        """
        {<fore.quiz>}
        ---
        {<back.quiz>}
        """
      =/  render  render-quiz:ql
      =/  =^quiz  quiz(view `(render(bol bowl) craw))
      ;div.mw-page.ma.mt3.p1.bd1
        =exam  exam
        =id    id
        ;a
          =style  "container-type: inline-size;"
          =href   "/hawk{(en-tape:pith:neo here.bowl)}{(en-tape:pith:neo pith)}"
          ;div.front.p1.fr.jb
            ;+  =/  m  (render-quiz-content view.quiz & fore.quiz)
                m(a.g [[%class (trip clas.cram)] a.g.m])
            ;div.fr.as.g2
              ;span.tr.p1.bd2.br3.mono: {id}
              ;span.p1.fr.je.mono.bd1.br2.b-1: front
            ==
          ==
          ;div.back.p1.fr.jb
            =style  "container-type: inline-size;"
            ;+  =/  m  (render-quiz-content view.quiz | back.quiz)
                m(a.g [[%class (trip clas.cram)] a.g.m])
            ;div.fr.as.g2
              ;span.p1.fr.je.mono.bd1.br2.b-3: back
            ==
          ==
        ==
      ==
    ==
  ==
::
++  deck
  =/  hid  ?:(=(%study mode.cram) "" "hidden")
  ;form
    =class  "deck b0 cram-tab grow basis-half scroll-x scroll-y wf hf {hid}"
    =hx-post  "/hawk{(en-tape:pith:neo here.bowl)}?stud=cram-diff"
    =hx-trigger  "cram-change-card"
    =hx-swap  "none"
    =head  "exam"
    =current  (scow %ud exam.cram)
    =tabindex  "0"
    =onkeydown  "cramHandleKey(event, $(this))"
    =style  "min-width: 300px; height: 100%;"
    =morph-retain  "class"
      ;+  %^  add-attr  %onclick
          """
          cramNext($(this).closest('.deck'));
          """
    ;div.relative.wf.hf
      ;div.study-controls.fr.g1.ac.js.absolute.p2.o7.z1
        =style  "top: 0; right: 0;"
        ;button.p2.b1.br1.bd1.hover
          =type  "button"
          =onclick  "cramPrevious($(this).closest('.deck'))"
          ;+  chevron-left.feather-icons
        ==
        ;span.cram-counter.f3.p2.b1.br1: 1/{<(lent ~(tap of:neo kids.bowl))>}
        ;button.p2.b1.br1.bd1.hover
          =type  "button"
          =onclick  "cramNext($(this).closest('.deck'))"
          ;+  chevron-right.feather-icons
        ==
        ;button.cram-fs-tog.p2.b1.br1.bd1.hover
          =type  "button"
          =onclick  "cramToggleFullscreen($(this).closest('.deck'));"
          ; ⛶
        ==
      ==
      ;*
      %+  turn
        ~(tap of:neo kids.bowl)
      |=  [=pith:neo =idea:neo]
      =/  =quiz
        ?:  =(%sig p.q.saga.idea)  *quiz
        !<(quiz q.q.saga.idea)
      =/  exam  (trip (snag 1 (pout pith)))
      =/  id  (trip (snag 3 (pout pith)))
      ;div.card-container
        =exam  exam
        =id    id
        =class  "{?:(=(exam.cram (slaw %ud (crip exam))) "" "hidden")}"
        ;div.card-content
          ;div.card-side.fr.jb.front
            =style  "container-type: inline-size;"
            ;div.card-body
            ;+  =/  m  (render-quiz-content view.quiz & fore.quiz)
                m(a.g [[%class (trip clas.cram)] a.g.m])
            ==
            ;div.fr.as.g2
              ;span.p1.fr.je.mono.bd1.br2.b-1: front
            ==
          ==
          ;div.card-side.fr.jb.back.hidden
            =style  "container-type: inline-size;"
            ;div.card-body
            ;+  =/  m  (render-quiz-content view.quiz | back.quiz)
                m(a.g [[%class (trip clas.cram)] a.g.m])
            ==
            ;div.fr.as.g2
              ;span.p1.fr.je.mono.bd1.br2.b-3: back
            ==
          ==
        ==
      ==
    ==
  ==
++  script
  ;script
    ;+  ;/  %-  trip
    '''
    function cramPrevious(deck) {
      let current = deck.attr('current');
      let cards = deck.find('[exam]');
      let currentIndex = cards.index(cards.filter(`:not(.hidden)`));
      let newIndex = Math.max(0, currentIndex - 1);
      cards.addClass('hidden');
      cards.eq(newIndex).removeClass('hidden');
      deck.attr('current', cards.eq(newIndex).attr('exam'));
      deck.attr('current-id', cards.eq(newIndex).attr('id'));
      deck.find('.cram-counter').text(`${newIndex}/${cards.length}`);
      triggerCardSave(deck[0]);
    }
    function cramDelete(deck) {
      let current = deck.attr('current');
      let cards = deck.find('[exam]');
      let currentIndex = cards.index(cards.filter(`:not(.hidden)`));
      let newIndex = Math.min(cards.length - 1, currentIndex + 1);
      cards.addClass('hidden');
      cards.eq(newIndex).removeClass('hidden');
      deck.attr('current', cards.eq(newIndex).attr('exam'));
      deck.attr('current-id', cards.eq(newIndex).attr('id'));
      deck.find('.cram-counter').text(`${newIndex}/${cards.length}`);
      triggerCardDelete(deck);
    }
    function cramNext(deck) {
      let current = deck.attr('current');
      let cards = deck.find('[exam]');
      let currentIndex = cards.index(cards.filter(`:not(.hidden)`));
      let newIndex = Math.min(cards.length - 1, currentIndex + 1);
      cards.addClass('hidden');
      cards.eq(newIndex).removeClass('hidden');
      deck.attr('current', cards.eq(newIndex).attr('exam'));
      deck.attr('current-id', cards.eq(newIndex).attr('id'));
      deck.find('.cram-counter').text(`${newIndex}/${cards.length}`);
      triggerCardSave(deck[0]);
    }
    function triggerCardSave(that) {
      const evt = new Event("cram-change-card");
      that.dispatchEvent(evt);
    }
    function triggerCardDelete(deck) {
      console.log(deck);
    }
    function cramToggleFullscreen(deck) {
      if (!!deck.attr('full')) {
        deck.removeAttr('full');
        document.exitFullscreen();
      } else {
        deck.attr('full', 'true');
        deck[0]?.requestFullscreen();
      }
    }
    function cramHandleKey(ev, deck) {
      let key = ev.key;
      if (['ArrowLeft'].includes(key)) {
        ev.preventDefault();
        ev.stopPropagation();
        cramPrevious(deck);
      } else if (['ArrowRight', ' '].includes(key)) {
        ev.preventDefault();
        ev.stopPropagation();
        cramNext(deck);
      } else if (key === 'f' || key === 'F') {
        ev.preventDefault();
        ev.stopPropagation();
        deck.find('.back').toggleClass('hidden');
      }
    }
    function cramChangeMode(that, tabs) {
      $(that).siblings().removeClass('toggled');
      $(that).addClass('toggled');
      $(that).closest('.cram').find('.cram-tab').addClass('hidden');
      tabs.forEach(t => {
        $(that).closest('.cram').find(t).removeClass('hidden');
        $(that).closest('.cram').find(t)[0]?.focus();
      })
    }
    '''
  ==
++  style
  ;style
    ;+  ;/  %-  trip
    '''
    .card-container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100%;
      padding: 20px;
    }
    .card-content {
      background-color: var(--b1);
      border-radius: 15px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 600px;
      overflow: hidden;
    }
    .card-side {
      padding: 30px;
    }
    .card-title {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
      text-align: center;
      color: var(--f1);
    }
    .card-body {
      font-size: 18px;
      line-height: 1.6;
      color: var(--f0);
    }
    .front {
      background-color: var(--b2);
    }
    .back {
      background-color: var(--b3);
    }
    '''
  ==
  ++  unline
    |=  =tape
    %+  turn  tape
    |=  =cord
    ?:(=(cord '\0a') ' ' cord)
  ++  add-attr
    |=  [=term =tape =manx]
    ^-  ^manx
    %=  manx
      a.g
        :-  [term (unline tape)]
        a.g.manx
    ==
--
