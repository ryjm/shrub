/@  card
/@  magic
/-  feather-icons
/>  htmx
:-  [%magic %$ %htmx]
|=  cl=magic
|=  =bowl:neo
^-  manx
|^
;div
  ;+  style
  ;div.p-4
    ;div.fr.ja
      ;h1.s5.tc.bold: Collection
      ;+  add
    ==
    ;div#magic.g4.frw.mt1
      ;*
      ?:  fetching.cl
        ;+  ;div.loading.text-center.p-4
          ;+  loading.feather-icons
        ==
    ~&  fetching/~
    (turn cards.cl |=(=card ((htmx card/!>(card)) bowl)))
    ==

  ==
==
++  add
  ;form
    =hx-post     "/hawk{(en-tape:pith:neo here.bowl)}?stud=magic-diff"
    =hx-swap     "none"
    =hx-trigger  "click from:button"
    =head        "fetch-cards"
    ;input.p2.mono.bd1.br1
      =name  "query"
      =type  "text"
      =value  "banned:legacy"
      =oninput      "$(this).attr('value', this.value);"
      ;
    ==
    ;button.bd2.m2.p2.bold.fr.js
      ;div.fr.js.loader
        ;span.loaded;
        ;+  add.feather-icons
        ;span.f4: Add Cards
      ==
    ==
  ==
++  style
  ^-  manx
  ;style
    ;+  ;/
    %-  trip
    '''
    .container { max-width: 1200px; margin: 0 auto; padding: 1rem; }
    .mx-auto { margin-left: auto; margin-right: auto; }
    .text-3xl { font-size: 1.875rem; line-height: 2.25rem; }
    .font-bold { font-weight: 700; }
    .mb-6 { margin-bottom: 1.5rem; }
    .grid { display: grid; }
    .gap-6 { gap: 1.5rem; }
    .gap-1 { gap: 0.25rem; }
    .grid-cols-2 { grid-template-columns: repeat(2, minmax(0, 1fr)); }
    .text-center { text-align: center; }
    .loading { display: flex; justify-content: center; align-items: center; }
    .bg-blue-500 { background-color: #3b82f6; }
    .hover-bg-blue-700:hover { background-color: #1d4ed8; }
    .text-white { color: white; }
    .rounded { border-radius: 0.25rem; }
    .rounded-lg { border-radius: 0.5rem; }
    .items-center { align-items: center; }
    .card-container { width: 70%; height: 80%; position: relative; }
    .card { transition: all 0.3s ease; position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
    .card:hover { transform: scale(1.1); }
    .card:hover .card-image { display: block !important; width: 100%; height: 100%; object-fit: cover; z-index: 20; }
    .shadow-lg { box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05); }
    .hover-shadow-xl:hover { box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04); }
    .overflow-hidden { overflow: hidden; }
    .transition-all { transition-property: all; }
    .transition-opacity { transition-property: opacity; }
    .duration-300 { transition-duration: 300ms; }
    .text-sm { font-size: 0.875rem; line-height: 1.25rem; }
    .text-xs { font-size: 0.75rem; line-height: 1rem; }
    .font-semibold { font-weight: 600; }
    .text-right { text-align: right; }
    .text-right { text-align: left; }
    .bg-gray-50 { background-color: #f9fafb; }
    .shadow-inner { box-shadow: inset 0 2px 4px 0 rgba(0, 0, 0, 0.06); }
    .mono { font-family: monospace; }
    .relative { position: relative; }
    .absolute { position: absolute; }
    .inset-0 { top: 0; right: 0; bottom: 0; left: 0; }
    .opacity-0 { opacity: 0; }
    .hover-opacity-100:hover { opacity: 1; }
    .object-cover { object-fit: cover; }
    .w-full { width: 100%; }
    .h-full { height: 100%; }
    @media (min-width: 768px) {
      .md-grid-cols-3 { grid-template-columns: repeat(3, minmax(0, 1fr)); }
    }
    @media (min-width: 1024px) {
      .lg-grid-cols-4 { grid-template-columns: repeat(4, minmax(0, 1fr)); }
    }
    @media (min-width: 1280px) {
      .xl-grid-cols-5 { grid-template-columns: repeat(5, minmax(0, 1fr)); }
    }
    '''
  ==
--
