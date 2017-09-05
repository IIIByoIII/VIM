" Vim syntax file
" Language:    REBOL
" Maintainer:  Robert Kiss
" Last Change: FEB 24 2015

" Description: Custom version of REBOL

filetype plugin on 
colorscheme xoria256
set iskeyword=42,43,45,48-57,60-63,65-90,95,97-122
"syn case ignore
syn sync fromstart
syn sync maxlines=150

"--------------
" Error:
syn region err          start=/\S/ end=/\s/he=e-1,me=e-1 end=/\n/
"--------------
" Functions:
" {{{
syn keyword func_a      about abs absolute access-os action? add ajoin alert alias all also alter and and~ any any-block? any-function? any-object? any-path? any-string? any-type? any-word? append apply arccosine arcsine arctangent array as-binary as-pair as-string ascii? ask assert at attempt
syn keyword func_b      back binary? bind bind? bitset? block? body-of bound? break brightness? browse build-attach-body build-markup build-tag
syn keyword func_c      call caret-to-offset case catch cause-error cd center-face change change-dir char? charset checksum choose clean-path clear clear-face clear-fields close closure closure? collect collect-words comment complement component? compose compress confine confirm connected? construct context copy copy* cosine cp create-link crypt-strength? cvs-date cvs-version
syn keyword func_d      datatype? date? dbug debase decimal? decloak decode-cgi decode-url decompress default deflag-face dehex delete delete-dir deline delta-time desktop detab dh-compute-key dh-generate-key dh-make-key difference dir? dirize disarm dispatch divide do do-boot do-browser do-events do-face do-face-alt do-thru does draw dsa-generate-key dsa-make-key dsa-make-signature dsa-verify-signature dt dump-face dump-obj dump-pane
syn keyword func_e      echo edge-size? editor eighth either else email? emailer empty? enbase encloak enline entab equal? error? even? event? exclude exists-thru? exists? exit exp extract
syn keyword func_f      fifth file? find find-key-face find-window first first+ flag-face flag-face? flash focus for forall foreach forever form forskip found? fourth free func funct function function?
syn keyword func_g      get get-env get-face get-modes get-net-info get-path? get-style get-word? greater-or-equal? greater?
syn keyword func_h      halt has hash? head head? help hide hide-popup hilight-all hilight-text hsv-to-rgb
syn keyword func_i      if image? import-email in in-dir in-window? index? info? inform input input? insert insert-event-func inside? install integer? intersect invalid-utf? issue?
syn keyword func_j      join
syn keyword func_l      last last? latin1? launch launch-thru length? lesser-or-equal? lesser? library? license link-app? link-relative-path link? list-dir list-env list? lit-path? lit-word? load load-image load-stock load-stock-block load-thru local-request-file log-10 log-2 log-e logic? loop lowercase ls
"layout is not included above
syn keyword func_m      make make-dir make-face map-each map? max maximum maximum-of min minimum minimum-of mod modified? modulo mold money? more move multiply
syn keyword func_n      native native? negate negative? net-error new-line new-line? next ninth none? not not-equal? notify now number?
syn keyword func_o      object? odd? offset-to-caret offset? op? open open-events or or~ outside? overlap?
syn keyword func_p      pair? paren? parse parse-email-addrs parse-header parse-header-date parse-xml path path-thru path? pick poke port? positive? power prin print probe protect protect-system pwd
syn keyword func_q      q query quit quote
syn keyword func_r      random read read-cgi read-io read-net read-thru recycle reduce refinement? reflect reform rejoin remainder remold remove remove-each remove-event-func rename repeat repend replace request request-color request-date request-dir request-download request-file request-list request-pass request-text resend reset-face resize-face resolve return reverse rgb-to-hsv rm round routine? rsa-encrypt rsa-generate-key rsa-make-key run
syn keyword func_s      same? save save-user scalar? screen-offset? script? scroll-drag scroll-face scroll-para second secure select send series? set set-env set-face set-font set-modes set-net set-para set-path? set-style set-user set-user-name set-word? seventh shift show show-popup sign? sine sixth size-text size? skip sort source span? spec-of speed? split-path square-root stats strict-equal? strict-not-equal? string? struct? stylize subtract suffix? swap switch
syn keyword func_t      tag? tail tail? take tangent tenth textinfo third throw throw-error throw-on-error time? title-of to to-binary to-bitset to-block to-char to-closure to-datatype to-date to-decimal to-email to-error to-file to-function to-get-path to-get-word to-hash to-hex to-idate to-image to-integer to-issue to-itime to-library to-list to-lit-path to-lit-word to-local-file to-logic to-map to-money to-none to-pair to-paren to-path to-port to-rebol-file to-refinement to-relative-file to-set-path to-set-word to-string to-tag to-time to-tuple to-typeset to-url to-word trace trim true? try tuple? type? types-of typeset?
syn keyword func_u      unbind undirize unfocus uninstall union unique unless unlight-text unprotect unset unset? until unview update upgrade uppercase url? Usage use utf?
syn keyword func_v      value? values-of vbug view viewed? viewtop
syn keyword func_w      wait what what-dir while win-offset? within? word? words-of write write-io write-user
syn keyword func_x      xor xor~ zero?
syn keyword func_other  system req-dir ? ?? ++ -- no-title no-border
"syn keyword func_a      about abs absolute add alert alias all alter and any any-block? any-function? any-string? any-type? any-word? append arccosine arcsine arctangent array as-pair ask at attempt
"syn keyword func_b      back binary? bind bitset? block? break brightness? browse build-tag
"syn keyword func_c      caret-to-offset catch center-face change change-dir char? charset checksum choose clean-path clear clear-fields close comment complement component? compose compress confirm connected? construct context copy cosine
"syn keyword func_d      datatype? date? debase decimal? decode-cgi decompress dehex delete delete-dir detab difference dir? dirize disarm dispatch divide do do-events does dump-face dump-obj
"syn keyword func_e      echo either else email? empty? enbase entab equal? error? even? event? exclude exists? exit exp extract
"syn keyword func_f      fifth file? find first flash focus for forall foreach forever form forskip found? fourth free func function function?
"syn keyword func_g      get get-modes get-word? greater-or-equal? greater?
"syn keyword func_h      halt has hash? head head? help hide hide-popup 
"syn keyword func_i      if image? import-email in in-dir in-window? index? info? inform input input? insert integer? intersect issue?
"syn keyword func_j      join
"syn keyword func_l      last launch length? lesser-or-equal? lesser? library? license link? list-dir list? lit-path? lit-word? load load-image log-10 log-2 log-e logic? loop lowercase
"syn keyword func_m      make make-dir make-face max maximum maximum-of min minimum minimum-of modified? mold money? multiply
"syn keyword func_n      native? negate negative? next none? not not-equal? now number?
"syn keyword func_o      object? odd? offset-to-caret offset? op? open or
"syn keyword func_p      pair? paren? parse parse-xml path? pick poke port? positive? power prin print probe protect protect-system
"syn keyword func_q      query quit 
"syn keyword func_r      random read read-io recycle reduce refinement? reform rejoin remainder remold remove remove-each rename repeat repend replace req-dir request request-color request-date request-dir request-download request-file request-list request-pass request-text resend return reverse routine?
"syn keyword func_s      same? save script? second secure select send series? set set-modes set-net set-path? set-word? show show-popup sign? sine size-text size? skip sort source span? split-path square-root strict-equal? strict-not-equal? string? struct? stylize subtract suffix? switch system
"syn keyword func_t      tag? tail tail? tangent third throw time? to to-binary to-bitset to-block to-char to-date to-decimal to-email to-file to-get-word to-hash to-hex to-idate to-image to-integer to-issue to-list to-lit-path to-lit-word to-local-file to-logic to-money to-pair to-paren to-path to-rebol-file to-refinement to-set-path to-set-word to-string to-tag to-time to-tuple to-url to-word trace trim try tuple? type?
"syn keyword func_u      unfocus union unique unprotect unset unset? until unview update upgrade uppercase url? usage use
"syn keyword func_v      value? view viewed?
"syn keyword func_w      wait what what-dir while within? word? write write-io
"syn keyword func_x      xor zero?
syn cluster allfuncs    contains=func_a,func_b,func_c,func_d,func_e,func_f,func_g,func_h,func_i,func_j,func_l,func_m,func_n,func_o,func_p,func_q,func_r,func_s,func_t,func_u,func_v,func_w,func_x
" }}}
"--------------
" Other: 
" {{{
syn region drivepath    start=.%. end=.\s.me=e-1,he=e-1 end=.\].me=e-1,he=e-1 end=.).me=e-1,he=e-1 end=.\n.
syn region path         start=./. end=.:.me=e-1,he=e-1 end=.\s.me=e-1,he=e-1 end=.\].me=e-1,he=e-1 end=.).me=e-1,he=e-1 end=.\n.
syn match paren1        .\[.
syn match paren1        .\].
syn match paren2        .(.
syn match paren2        .).
syn keyword operators   * ** + - < <= <> = == =? > >= !==
syn match operators     .\s/\s.ms=s+1,hs=s+1,me=e-1,he=e-1
syn match operators     .^/\s.me=e-1,he=e-1
syn match operators     .\s//\s.ms=s+1,hs=s+1,me=e-1,he=e-1
syn match operators     .^//\s.me=e-1,he=e-1
syn region strings      start=.". end=.".
syn region strings      start=.{. end=.}.
syn region comments     start=.;. end=.\n.
syn match variable      /\w/ contains=path                          "evaluate to its value
syn match variable      /\w[-0-9A-Za-z_/]\+/ contains=path          "evaluate to its value
syn match files         /\w\+\.\w\+/
syn match variable_def  /\w:/ contains=path                         "set variable to value
syn match variable_def  /\w[-0-9A-Za-z_/]\+:/ contains=path         "set variable to value
syn match variable_get  /\s:\w/ contains=path                       "get the value of variable
syn match variable_get  /\s:\w[-0-9A-Za-z_/]\+/ contains=path       "get the value of variable
syn match variable_lit  /'\w/ contains=path                         "the word literally ex: set 'word 12 - same as word: 12
syn match variable_lit  /'\w[-0-9A-Za-z_/]\+/ contains=path         "the word literally ex: get 'word - same as :word
syn match inumber       /\s\d\+/
syn match inumber       /\s-\d\+/
syn match rnumber       /\s\.\d\+/
syn match rnumber       /\s\d\+\./
syn match rnumber       /\s-\d\+\./
syn match rnumber       /\s\d\+\.\d\+/
syn match rnumber       /\s-\d\+\.\d\+/
syn match color_nr      /\s\d\+\.\d\+\.\d\+/hs=s+1                  "tuple
syn match ip_nr         /\s\d\+\.\d\+\.\d\+\.\d\+/hs=s+1            "tuple
syn match ver_nr        /\s\d\+\.\d\+\.\d\+\.\d\+\.\d\+/hs=s+1      "tuple
syn match the_x         /x/ contained                               "x from pairs
syn match the_after_x   /x-\=\d\+/ contains=the_x contained         "x from pairs
syn match dimension     /\s-\=\d\+x-\=\d\+/ contains=the_after_x      "pairs
syn match e_mail        .\w\+@\w\+\.\w\+.
syn match proginit      /^REBOL/
syn match exclamation   .!.
syn match questionmark  .?.
syn match hashtag       .#.
syn region dateformat   start=.\s\d\+[/-]\w\+[/-]\d\+. end=.\s.me=e-1,he=e-1 end=.\].me=e-1,he=e-1 end=.).me=e-1,he=e-1 end=.\n.
syn region links        start=.http:. end=.\s.me=e-1,he=e-1 end=.\].me=e-1,he=e-1 end=.).me=e-1,he=e-1 end=.\n.
syn region links        start=.ftp:. end=.\s.me=e-1,he=e-1 end=.\].me=e-1,he=e-1 end=.).me=e-1,he=e-1 end=.\n.
" }}}
"--------------
" Visual Interface Dialect:
" {{{
syn keyword vidrefine   left center right font font-name font-size bold italic middle contained
syn keyword viddraw     box circle fill-pen flood font image line line-pattern pen polygon text 
syn keyword viddrawrefs line-width line-pattern gradient center radius angle-begin angle-length closed radius-x radius-y upper-left-point diameter
syn keyword videffects  invert contrast colorize gradcol tint luma grayscale emboss flip rotate blur sharpen
"duplicate words for effects and rebol functions: reflect multiply 

"arc curve ellipse
"syn keyword vidcolors   black blue navy orange gold tan coal green leaf forest brown coffee gray cyan teal aqua water sky pewter red maroon brick crimson pink silver magenta purple violet papaya rebolor snow yellow olive oldrab khaki mint white ivory linen beige base-color reblue sienna wheat
syn keyword vidlay      layout contained
syn keyword vidkeywords across at backcolor backeffect below do guide indent lab offset origin pad return style styles space size tabs tab wrap check-line contained
syn keyword vidstyles   title h1 h2 h3 h4 h5 banner vh1 vh2 vh3 text txt vtext tt code label field info area sensor image box backdrop backtile icon led anim button btn toggle tog rotary choice check radio arrow progress slider panel list text-list key contained
syn keyword vidfacets   offset size span pane text data color image effect edge font para feel rate options saved-area line-list contained
syn keyword vidextens   colors texts effects action alt-action keycode state dirty? help file style user-data contained
syn keyword vidother    with merge gradient over away
syn region vidlayout    start=.\slayout. end=.endlayout.me=e-10,he=e-10 contains=vidother,vidrefine,viddraw,videffects,vidcolors,vidlay,vidkeywords,vidstyles,vidfacets,vidextens,inumber,rnumber,color_nr,ip_nr,ver_nr,dimension,strings,variable_def,paren1,paren2,drivepath,path,comments,func_a,func_b,func_c,func_d,func_e,func_f,func_g,func_h,func_i,func_j,func_l,func_m,func_n,func_o,func_p,func_q,func_r,func_s,func_t,func_u,func_v,func_w,func_x,func_other,exclamation,questionmark,hashtag,e_mail,files,operators,vc01,vc02,vc03,vc04,vc05,vc06,vc07,vc08,vc09,vc10,vc11,vc12,vc13,vc14,vc15,vc16,vc17,vc18,vc19,vc20,vc21,vc22,vc23,vc24,vc25,vc26,vc27,vc28,vc29,vc30,vc31,vc32,vc33,vc34,vc35,vc36,vc37,vc38,vc39,vc40,vc41,vc42,vc43,vc44
" }}}
"--------------
" VID Color Keyword Names:
"{{{
syn keyword vc01        black
syn keyword vc02        blue 
syn keyword vc03        navy 
syn keyword vc04        orange 
syn keyword vc05        gold 
syn keyword vc06        tan 
syn keyword vc07        coal 
syn keyword vc08        green 
syn keyword vc09        leaf 
syn keyword vc10        forest 
syn keyword vc11        brown 
syn keyword vc12        coffee 
syn keyword vc13        gray 
syn keyword vc14        cyan 
syn keyword vc15        teal 
syn keyword vc16        aqua 
syn keyword vc17        water 
syn keyword vc18        sky 
syn keyword vc19        pewter 
syn keyword vc20        red 
syn keyword vc21        maroon 
syn keyword vc22        brick 
syn keyword vc23        crimson 
syn keyword vc24        pink 
syn keyword vc25        silver 
syn keyword vc26        magenta 
syn keyword vc27        purple 
syn keyword vc28        violet 
syn keyword vc29        papaya 
syn keyword vc30        rebolor 
syn keyword vc31        snow 
syn keyword vc32        yellow 
syn keyword vc33        olive 
syn keyword vc34        oldrab 
syn keyword vc35        khaki 
syn keyword vc36        mint 
syn keyword vc37        white 
syn keyword vc38        ivory 
syn keyword vc39        linen 
syn keyword vc40        beige 
syn keyword vc41        base-color 
syn keyword vc42        reblue 
syn keyword vc43        sienna 
syn keyword vc44        wheat
"}}}
" VID Colors Of Names:
" {{{
hi vc01                 guifg=#dddddd guibg=#000000
hi vc02                 guifg=#dddddd guibg=#0000ff
hi vc03                 guifg=#dddddd guibg=#000080
hi vc04                 guifg=#222222 guibg=#ff960a
hi vc05                 guifg=#222222 guibg=#ffcd28
hi vc06                 guifg=#222222 guibg=#deb887
hi vc07                 guifg=#dddddd guibg=#404040
hi vc08                 guifg=#222222 guibg=#00ff00
hi vc09                 guifg=#222222 guibg=#008000
hi vc10                 guifg=#dddddd guibg=#003000
hi vc11                 guifg=#222222 guibg=#8b4513
hi vc12                 guifg=#dddddd guibg=#4c1a00
hi vc13                 guifg=#222222 guibg=#808080
hi vc14                 guifg=#222222 guibg=#00ffff
hi vc15                 guifg=#222222 guibg=#008080
hi vc16                 guifg=#222222 guibg=#286482
hi vc17                 guifg=#222222 guibg=#506c8e
hi vc18                 guifg=#222222 guibg=#a4c8ff
hi vc19                 guifg=#222222 guibg=#aaaaaa
hi vc20                 guifg=#dddddd guibg=#ff0000
hi vc21                 guifg=#dddddd guibg=#800000
hi vc22                 guifg=#dddddd guibg=#b22222
hi vc23                 guifg=#222222 guibg=#dc143c
hi vc24                 guifg=#222222 guibg=#ffa4c8
hi vc25                 guifg=#222222 guibg=#c0c0c0
hi vc26                 guifg=#222222 guibg=#ff00ff
hi vc27                 guifg=#dddddd guibg=#800080
hi vc28                 guifg=#dddddd guibg=#48005A
hi vc29                 guifg=#222222 guibg=#FF5025
hi vc30                 guifg=#222222 guibg=#8E806E
hi vc31                 guifg=#222222 guibg=#F0F0F0
hi vc32                 guifg=#222222 guibg=#FFFF00
hi vc33                 guifg=#222222 guibg=#808000
hi vc34                 guifg=#dddddd guibg=#484810
hi vc35                 guifg=#222222 guibg=#B3B37E
hi vc36                 guifg=#222222 guibg=#648874
hi vc37                 guifg=#222222 guibg=#FFFFFF
hi vc38                 guifg=#222222 guibg=#FFFFF0
hi vc39                 guifg=#222222 guibg=#FAF0E6
hi vc40                 guifg=#222222 guibg=#FFE4C4
hi vc41                 guifg=#222222 guibg=#A0B4A0
hi vc42                 guifg=#dddddd guibg=#263A6C
hi vc43                 guifg=#222222 guibg=#A0522D
hi vc44                 guifg=#222222 guibg=#F5DE81
" }}}
"--------------
" Colors:
" {{{
hi vidrefine            guifg=#ff9999
hi viddraw              guifg=#ff4444 gui=bold
hi viddrawrefs          guifg=#ff4488 gui=bold
hi videffects           guifg=#cc66cc gui=bold
hi vidcolors            guifg=#222222 guibg=#999999
hi vidlay               guifg=#3355ff gui=bold gui=underline
hi vidkeywords          guifg=#ff3333 gui=bold
hi link vidstyles       vidkeywords     
hi link vidfacets       vidkeywords     
hi link vidextens       vidkeywords     
hi link vidother        vidkeywords     
hi vidlayout            guifg=#339922
"hi vidbutton            guifg=#44ff00
"hi vidtoggle            guifg=#66ff00
"hi vidrotary            guifg=#88ff00
"hi vidchoice            guifg=#aaff00
"hi vidtext              guifg=#ccff00

hi link err             Error
hi proginit             guifg=#ddaa00 gui=bold

hi drivepath            guifg=#aadd00 gui=bold gui=underline
hi e_mail               guifg=#aa66ff gui=bold
hi path                 guifg=#dd5555
hi paren1               guifg=#ffff00 gui=bold
hi link paren2          paren1
hi operators            guifg=#cccccc gui=bold
hi inumber              guifg=#00aa99
hi rnumber              guifg=#88ccff
hi color_nr             guifg=#ffdd00 guisp=#999999 gui=undercurl
hi ip_nr                guifg=#33bbdd gui=underline
hi ver_nr               guifg=#8855dd guisp=#0066dd gui=undercurl
hi strings              guifg=#ddbb88
hi dimension            guifg=#3388dd gui=bold
hi the_x                guifg=#aaaaaa gui=bold
hi the_after_x          guifg=#3388dd gui=bold
hi comments             guifg=#666666
hi variable             guifg=#66cc55
hi variable_def         guifg=#ee8833
hi variable_lit         guifg=#ffddbb gui=bold
hi exclamation          guifg=#ffddbb gui=bold
hi questionmark         guifg=#ffddbb gui=bold
hi hashtag              guifg=#ffddbb gui=bold
hi files                guifg=#ff5588
hi dateformat           guifg=#9999ff
hi links                guifg=#99bbdd

"hi link func_a          Statement
hi func_a               guifg=#3399dd gui=bold

"--------------
hi link func_b func_a
hi link func_c func_a
hi link func_d func_a
hi link func_e func_a
hi link func_f func_a
hi link func_g func_a
hi link func_h func_a
hi link func_i func_a
hi link func_j func_a
hi link func_l func_a
hi link func_m func_a
hi link func_n func_a
hi link func_o func_a
hi link func_p func_a
hi link func_q func_a
hi link func_r func_a
hi link func_s func_a
hi link func_t func_a
hi link func_u func_a
hi link func_v func_a
hi link func_w func_a
hi link func_x func_a
hi link func_other func_a
" }}}
"--------------
let b:current_syntax = "rebyol"
