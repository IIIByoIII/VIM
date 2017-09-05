" Vim syntax file
" Language:    Python 2
" Maintainer:  Robert Kiss
" Last Change: Sep 28 2015

" Description: Custom version of Python

filetype plugin on 
colorscheme xoria256
set iskeyword=42,43,45,48-57,60-63,65-90,95,97-122
syn case ignore
"syn case match
syn sync fromstart
syn sync maxlines=150

"--------------
" Error:
syn region err          start=/\S/ end=/\s/he=e-1,me=e-1 end=/\n/
"--------------
" Functions:
" {{{
" }}}
"--------------
" Other: 
" {{{
syn keyword funcsresrvd and assert break class continue def del elif else except exec finally for from global if import in is lambda not or pass print raise return try while with yield
syn keyword funcsconver int long float complex str repr eval tuple list set dict frozenset chr unichr ord hex oct
syn keyword funcsmathem abs ceil cmp exp fabs floor log log10 max min modf pow round sqrt
syn keyword funcsrandom choice randrange random seed shuffle uniform
syn keyword funcstrigon acos asin atan atan2 cos hypot sin tan degrees radians
syn keyword funcsstrmet capitalize center count decode encode endswith expandtabs find index isalnum isalpha isdigit islower isnumeric isspace istitle isupper join len ljust lower lstrip maketrans max min replace rfind rindex rjust rstrip split splitlines startswith strip swapcase title translate upper zfill isdecimal
syn keyword funcslists  cmp len max min list tuple str type
syn keyword funcsinput  input raw_input 
syn keyword funcsfiles  open close write read tell seek rename remove mkdir chdir getcwd rmdir
syn keyword constants   pi e
" strings: paragraphs sentences words
syn region strings      start=.""". end=.""". contains=escapedchars,strformaters  
syn region strings      start=.r""". end=.""".
syn region strings      start=.'''. end=.'''. contains=escapedchars,strformaters  
syn region strings      start=.r'''. end=.'''.
syn region strings      start=.'. end=.'. contains=escapedchars,strformaters  
syn region strings      start=.r'. end=.'.
syn region strings      start=.". end=.". contains=escapedchars,strformaters  
syn region strings      start=.r". end=.".
syn region comments     start=.#. end=.\n.

" escaped characters: newline backspace escape return space tab
syn match escapedchars  .\(\\n\|\\b\|\\e\|\\r\|\\s\|\\t\). contained
syn match strformaters  .\(%c\|%s\|%i\|%d\|%u\|%o\|%x\|%X\|%e\|%E\|%f\|%g\|%G\). contained
syn match colon         .:.
syn match semicolon     .;.
syn match comma         .,.
syn match drivepath     .$\s\S\+.
syn match multiline     .\\\n.
syn match multiline     .\\\s\+\n.
syn match paren1        .(.
syn match paren1        .).
syn match paren2        .\[.
syn match paren2        .\].
syn match paren3        .{.
syn match paren3        .}.
syn keyword operators   + - * / % ** // == != <> > < >= <= += -= *= /= %= **= //= & ^ ~ << >> 
syn match nr_intdec     /-\=\d\+/
syn match nr_intoct     /-\=0\o\+/
syn match nr_inthex     /-\=0x\x\+/
syn match nr_intlongdec /-\=\d\+L/
syn match nr_intlongoct /-\=0\o\+L/
syn match nr_intlonghex /-\=0x\x\+L/
syn match nr_float      /-\=\d\*\.\d\*/
syn match nr_float      /-\=\d\*\.\d\+[+-]e\d\+/



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
