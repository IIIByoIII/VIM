" Vim syntax file
" Language:    NewLISP
" Maintainer:  Robert Kiss
" Last Change: May 18 2015

" Description: Custom version of NewLISP

filetype plugin on 
colorscheme xoria256
set iskeyword=35-37,45,48-57,63-90,95,97-122
"syn case ignore
"set guioptions+=b
syn sync fromstart
syn sync maxlines=150

"--------------
" Variables:
syn region variables	start=.\S. end=.\s.he=e-1,me=e-1 end=.).he=e-1,me=e-1 end=.\n.
"--------------
" Functions:
" {{{
syn keyword func_a      abort abs acos acosh add address amb and append append-file apply args array array-list array? asin asinh assoc atan atan2 atanh atom?
syn keyword func_b      base64-dec base64-enc bayes-query bayes-train begin beta betai bigint bigint? bind binomial bits
syn keyword func_c      callback case catch ceil change-dir char chop clean close collect command-event cond cons constant context context?  copy copy-file corr cos cosh count cpymem crc32 crit-chi2 crit-f crit-t crit-z current-line curry
syn keyword func_d      date date-list date-parse date-value debug dec def-new default define-macro delete delete-file delete-url destroy det device difference directory directory?  display-html div do-until do-while doargs dolist dostring dotimes dotree dump dup
syn keyword func_e      empty? encrypt ends-with env erf error-event eval eval-string eval-string-js even? exec exists exit exp expand explode extend
syn keyword func_f      factor fft file-info file? filter find find-all first flat float float? floor flt fn for for-all fork format fv
syn keyword func_g      gammai gammaln gcd get-char get-float get-int get-long get-string get-url global global?
syn keyword func_i      if ifft import inc index inf? int integer? intersect invert irr
syn keyword func_j      join json-error json-parse
syn keyword func_k      kmeans-query kmeans-train
syn keyword func_l      lambda lambda-macro lambda? last last-error legal? length let letex letn list list? load local log lookup lower-case
syn keyword func_m      macro macro? main-args make-dir map mat match max member min mod mul multiply
syn keyword func_n      name net-accept net-close net-connect net-error net-eval net-interface net-ipv net-listen net-local net-lookup net-packet net-peek net-ping net-receive net-receive-from net-receive-udp net-select net-send net-send-to net-send-udp net-service net-sessions new nil? normal not now nper npv nth null? number?
syn keyword func_o      odd? open or ostype
syn keyword func_p      pack parse peek pipe pmt pop pop-assoc post-url pow prefix pretty-print primitive? print println prob-chi2 prob-f prob-t prob-z process prompt-event protected? push put-url pv
syn keyword func_q      quote quote?
syn keyword func_r      rand random randomize read read-char read-expr read-file read-key read-line read-utf8 reader-event real-path receive ref ref-all regex regex-comp remove-dir rename-file replace reset rest reverse rotate round
syn keyword func_s      save search seed seek select self semaphore send sequence series set set-locale set-ref set-ref-all setf setf setq sgn share signal silent sin sinh sleep slice sort source spawn sqrt starts-with stats string string? struct sub swap sym symbol? symbols sync sys-error sys-info
syn keyword func_t      t-test tan tanh term throw throw-error time time-of-day timer title-case trace trace-highlight transpose trim true?
syn keyword func_u      unicode unify union unique unless unpack until upper-case utf8 utf8len
syn keyword func_w      wait-pid when while write write-char write-file write-line
syn keyword func_x      xfer-event xml-error xml-parse xml-type-tags
syn keyword func_z      zero?
syn cluster allfunctions contains=func_a,func_b,func_c,func_d,func_e,func_f,func_g,func_i,func_j,func_k,func_l,func_m,func_n,func_o,func_p,func_q,func_r,func_s,func_t,func_u,func_w,func_x,func_z,operators 
" }}}
"--------------
" Other: 
" {{{
syn region strings	start=.". skip=.\\". end=.". contains=quotes,newline
syn region comments	start=.;. end=.$. contains=commentsprite 
syn region comments2	start=.;;. end=.$. contains=commentsprite 
syn region comments3	start=.;;;. end=.$. contains=commentsprite 
syn region commentblock	start=.;|. end=.|;. keepend contains=commentsprite 
syn region commentsprite start=.-|. end=.$. end=.|-. contained

syn match squote        .\('>\|'<\|'\).
syn match squote        .'().
syn match colon         .:.
syn match quotes        .\\". contained
syn match newline       .\\n. contained
syn match paren         .[()].

syn keyword define      define contained
syn match paren1        .). contained
syn match paren2        .(. contained
syn match customfun     /define\s\S\+/ contains=define,paren2
syn match customfun2    /([^) ]\+[) ]/he=e-1,me=e-1 contains=paren2,@allfunctions,customfun

"operators   + - * / = != < <= > >= ++ -- ! ~ ^ | & << >>
syn match operators     .\((+\s\|(-\s\|(\*\s\|(/\s\|(=\s\|(!=\s\|(<\s\|(<=\s\|(>\s\|(>=\s\|(++\s\|(--\s\).me=e-1,he=e-1 contains=paren2
"syn match operators    .\((!\s\|(\~\s\|(\^\s\|(|\s\|(&\s\|(<<\s\|(>>\s\).me=e-1,he=e-1 contains=paren2
syn match operators     .\((!\s\|(\~\s\|(\^\s\|(|\s\|(&\s\|(<<\s\|(>>\s\).me=e-1,he=e-1 contains=paren2

syn region cflocalvars  start="/" end=")"me=e-1 contained
syn region customfun3   start="(define" end=")"me=e-1 contains=paren1,paren2,customfun,cflocalvars

syn match inumbers      /-\=\d\+[) \n]/me=e-1,he=e-1
syn match inumbers      /(-\=\d\+[) \n]/me=e-1,he=e-1 contains=paren2
syn match rnumbers      /-\=\d\+\.\d\+[) \n]/me=e-1,he=e-1
syn match rnumbers      /(-\=\d\+\.\d\+[) \n]/me=e-1,he=e-1 contains=paren2
" }}}
"--------------
" Colors:
" {{{
"hi vidrefine            guifg=#ff9999
"hi viddraw              guifg=#ff4444 gui=bold
"hi viddrawrefs          guifg=#ff4488 gui=bold
"hi videffects           guifg=#cc66cc gui=bold
"hi vidcolors            guifg=#222222 guibg=#999999
"hi vidlay               guifg=#3355ff gui=bold gui=underline
"hi vidkeywords          guifg=#ff3333 gui=bold
"hi link vidstyles       vidkeywords     
"hi link vidfacets       vidkeywords     
"hi link vidextens       vidkeywords     
"hi link vidother        vidkeywords     
"hi vidlayout            guifg=#339922
"hi vidbutton            guifg=#44ff00
"hi vidtoggle            guifg=#66ff00
"hi vidrotary            guifg=#88ff00
"hi vidchoice            guifg=#aaff00
"hi vidtext              guifg=#ccff00

"hi link err             Error
hi squote               guifg=#bbff66 gui=bold 
hi quotes       		guifg=#ffccbb
hi strings		        guifg=#886655
hi paren                guifg=#aa7711
hi comments		        guifg=#505050
hi comments2		    guifg=#bbbbbb
hi comments3		    guifg=#202020 guibg=#bbbbbb gui=bold
hi commentblock	        guifg=#ff4040 gui=bold
hi commentsprite        guifg=#eeff33 gui=bold
hi rnumbers             guifg=#55ffdd 
hi inumbers             guifg=#00dd33 
hi customfun            guifg=#cc99ff 
hi customfun3           guifg=#dddd99
hi cflocalvars          guifg=#88aa77
hi variables            guifg=#ffaa77

hi func_a               guifg=#33bbff gui=bold

hi link customfun2 customfun
hi link paren1 paren
hi link paren2 paren
hi link define func_a
hi link newline quotes
"--------------
hi link func_b func_a
hi link func_c func_a
hi link func_d func_a
hi link func_e func_a
hi link func_f func_a
hi link func_g func_a
hi link func_i func_a
hi link func_j func_a
hi link func_k func_a
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
hi link func_w func_a
hi link func_x func_a
hi link func_z func_a
" }}}
"--------------
let b:current_syntax = "newlisp"
