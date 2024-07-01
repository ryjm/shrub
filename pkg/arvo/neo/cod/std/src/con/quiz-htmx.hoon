/@  quiz
/-  ql=quiz
/-  feather-icons
:-  [%quiz %$ %htmx]
|=  q=quiz
|=  =bowl:neo
|^
  ^-  manx
  ;div.quiz.fc.relative.wf.hf
    ;+  controls
    ;div.frw.js.af.scroll-y.hf
      ;+  editor
      ;+  previewer
    ==
    ;+  script
    ;+  style
  ==
++  controls
  =/  cls  "p-1 br1 b1 hover"
  ;form.p2.frw.js.ac.g3.sticky.wf
    =style  "top:0; left: 0;"
    =hx-post  "/hawk{(en-tape:pith:neo here.bowl)}?stud=quiz-diff"
    =hx-swap  "none"
    =head  "mode"
    ;button
      =class  "{cls} {(trip ?:(=(%edit mode.q) 'toggled' ''))}"
      =morph-retain  "class"
      =type  "submit"
      =onclick  "quizChangeMode(this, ['.quiz-editor'])"
      =mode  "edit"
      ; edit
    ==
    ;button
      =class  "{cls} {(trip ?:(=(%both mode.q) 'toggled' ''))}"
      =morph-retain  "class"
      =type  "submit"
      =onclick  "quizChangeMode(this, ['.quiz-editor', '.quiz-previewer'])"
      =mode  "both"
      ; both
    ==
    ;button
      =class  "{cls} {(trip ?:(=(%preview mode.q) 'toggled' ''))}"
      =morph-retain  "class"
      =type  "submit"
      =onclick  "quizChangeMode(this, ['.quiz-previewer'])"
      =mode  "preview"
      ; preview
    ==
  ==
++  editor
  =/  open  ?|(=(%edit mode.q) =(%both mode.q))
  =/  hid  ?:(open "" "hidden")
  ;div
    =class  "quiz-editor quiz-tab {hid} basis-half grow fc"
    =morph-retain  "class"
    ;form
      =class  "fc p1 g1 scroll-y relative grow"
      =style  "min-width: 300px; height: 100%;"
      =hx-post  "/hawk{(en-tape:pith:neo here.bowl)}?stud=quiz"
      =hx-swap  "morph"
      =hx-target  "closest .quiz"
      =hx-select  ".quiz"
      =hx-trigger  "input changed delay:0.4s from:find input, input changed delay:0.4s from:find textarea"
      =morph-retain  "class"
      ;input.p2.mono.bd1.br1
        =name  "classes"
        =placeholder  "prose p3"
        =type  "text"
        =autocomplete  "off"
        =value  "prose"
        =oninput  "$(this).attr('value', this.value);"
        ;
      ==
      ;textarea.p-page.pre.mono.scroll-x.grow.bd1.m0.br1
        =name  "fore"
        =morph-no-swap  ""
        =oninput  "this.setAttribute('value', this.value);"
        =spellcheck  "false"
        =value  (trip fore.q)
        =placeholder  "Front of the card"
        ; {(trip fore.q)}
      ==
      ;textarea.p-page.pre.mono.scroll-x.grow.bd1.m0.br1
        =name  "back"
        =morph-no-swap  ""
        =oninput  "this.setAttribute('value', this.value);"
        =spellcheck  "false"
        =value  (trip back.q)
        =placeholder  "Back of the card"
        ; {(trip back.q)}
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
++  previewer
  =/  open  ?|(=(%preview mode.q) =(%both mode.q))
  =/  hid  ?:(open "" "hidden")
  =/  craw=@t
    %-  crip
    """
    {(trip fore.q)}
    ---
    {(trip back.q)}
    """
  ;main
    =class  "quiz-previewer quiz-tab grow hf basis-half scroll-x scroll-y br1 {hid}"
    =style  "min-width: 300px;"
    =morph-retain  "class"
    ;div.p-page
      ;div.mw-page.ma.mt3.p1.bd1
        ;div
          =style  "container-type: inline-size;"
          ;div.front.p1.fr.jb
            ;+
            ~&  craw
            =|  newb=bowl:neo
            =/  render  render-quiz:ql
            =.  here.newb  here.bowl
            =.  bol.render  newb
            =/  rendered  (render craw)
            ~&  >>  "rendered-quiz: {<rendered>}"
            =/  view  `rendered
            =/  new=quiz  q(view view)
            ~&  >>  "new-quiz: {<new>}"
            =/  m  (render-quiz-content view.q & fore.q)
              m(a.g [[%class "prose"] a.g.m])
            ;div.fr.as.g2
              ;span.p1.fr.je.mono.bd1.br2.b-1: front
            ==
          ==
          ;div.back.p1.fr.jb
            ;+
            ~&  craw
            =|  newb=bowl:neo
            =/  render  render-quiz:ql
            =.  here.newb  here.bowl
            =.  bol.render  newb
            =/  rendered  (render craw)
            ~&  >>  "rendered-quiz: {<rendered>}"
            =/  view  `rendered
            =/  new=quiz  q(view view)
            ~&  >>  "new-quiz: {<new>}"
            =/  m  (render-quiz-content view.q | back.q)
                m(a.g [[%class "prose"] a.g.m])
            ;div.fr.as.g2
              ;span.p1.fr.je.mono.bd1.br2.b-3: back
            ==
          ==
        ==
      ==
    ==
  ==
++  render-quiz-content
  |=  [=view:quiz is-front=? fallback=@t]
  ^-  manx
  ~&  >>  "rendering: {<view>}"
  ?~  view
    ;div: {(trip fallback)}
  ?-  -.u.view
      %.y
    ~&  >>  "view: {<p.p.u.view>}"
    ~&  >>  "view: {<q.p.u.view>}"
    ?:(is-front p.p.u.view q.p.u.view)
      %.n

    ~&  >>  "quiz error: {<q>}"
    ~&  >>  "quiz error: {<p.u.view>}"
    =-  ~&  >>  -  -
    (error:ql p.u.view)
  ==
++  script
  ;script
    ;+  ;/  %-  trip
    '''
    function quizChangeMode(that, tabs) {
      $(that).siblings().removeClass('toggled');
      $(that).addClass('toggled');
      $(that).closest('.quiz').find('.quiz-tab').addClass('hidden');
      tabs.forEach(t => {
        $(that).closest('.quiz').find(t).removeClass('hidden');
        $(that).closest('.quiz').find(t)[0]?.focus();
      })
    }
    function toggleQuizSide() {
      $('.front, .back').toggleClass('hidden');
    }
    '''
  ==
++  style
  ;style
  ;+  ;/  %-  trip
  '''
    .quiz {
      overflow-y: auto;
      padding: 4cqw 6cqw;
      font-size: 2.4cqw;
    }
  '''
  ==
--
