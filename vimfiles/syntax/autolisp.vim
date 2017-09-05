" Vim syntax file
" Language:    AutoLisp for progeCAD
" Maintainer:  ing Kiss Robert
" Last Change: Nov 20, 2013
" Description: AutoLisp Syntax

"--------------
filetype plugin on 
"colorscheme xoria256
syntax sync fromstart
set guioptions+=b
set nowrap

set foldmethod=marker
set iskeyword=33-38,42-126
"--------------
syn region variables	start=.\S. end=.\s.he=e-1,me=e-1 end=.).he=e-1,me=e-1 end=.\n.

"--------------
syn case match

"--------------
syn keyword func_a	abs acad_colordlg acad_strlsort action_tile add_list ads alert alloc and angle angtof angtos append apply ascii assoc atan atof atoi atom atoms-family autoload autoxload
syn keyword func_b	boole boundp
syn keyword func_c	caddr cadr car cdr chr client_data_table close cond cons cos cvunit
syn keyword func_com    command
syn keyword func_d	dimx_tile dictadd dictnext dictremove dictrename dictsearch dimy_tile distance distof done_dialog
syn keyword func_e	end_image end_list entdel entget entlast entmake entmakex entmod entnext entsel entupd eq equal eval *error* exit exp expand expt
syn keyword func_f	fill_image findfile fix float foreach
"function
syn keyword func_g	gc gcd get_attr get_tile getangle getcfg getcname getcorner getdist getenv getfiled getint getkword getorient getpoint getreal getstring getvar graphscr grclear grdraw grread grtext grvecs
syn keyword func_h	handent help
syn keyword func_i	if initget inters itoa
"initdia
syn keyword func_l	lambda last length list listp load load_dialog log log10 logand logior lpad lsh
syn keyword func_m	mapcar max mem member menucmd menugroup min minusp mode_tile
syn keyword func_n	nil namedobjdict nentsel nentselp new_dialog not nth null numberp
syn keyword func_o	open or osnap
syn keyword func_p	pi polar prin1 princ print progn prompt
syn keyword func_q	quit quote
syn keyword func_r	read read-char read-line redraw regapp rem repeat reverse rpad rtos
syn keyword func_s	set set_tile setcfg setenv setfunhelp setq setvar setview sin slide_image snvalid sqrt ssadd ssdel ssget ssgetfirst sslength ssmemb ssname ssnamex sssetfirst start_dialog start_image start_list startapp strcase strcat strlen subst substr
syn keyword func_t	T t tan tblnext tblobjname tblsearch term_dialog terpri textbox textpage textscr trace trans trim type
syn keyword func_u	unload_dialog untrace                                               
syn keyword func_v	vector_image ver vmon vports
syn keyword func_w	wcmatch while write-char write-line
syn keyword func_x	xdroom xdsize xload xunload
syn keyword func_z	zerop
syn cluster allfunctions contains=func_a,func_b,func_c,func_d,func_e,func_f,func_g,func_h,func_i,func_l,func_m,func_n,func_o,func_p,func_q,func_r,func_s,func_t,func_u,func_v,func_w,func_x,func_z,func_com,operators 

syn region strings	start=.". skip=.\\". end=.". contains=quotes,newline
syn region comments	start=.;. end=.$. contains=commentsprite 
syn region comments2	start=.;;. end=.$. contains=commentsprite 
syn region comments3	start=.;;;. end=.$. contains=commentsprite 
syn region commentblock	start=.;|. end=.|;. keepend contains=commentsprite 
syn region commentsprite start=.-|. end=.$. end=.|-. contained
"syn region paren    start=.(. end=.). contains=ALL

syn match squote        .\('>\|'<\|'\).
syn match squote        .'().
syn match quotes        .\\". contained
syn match newline       .\\n. contained
syn match paren         .[()].

syn keyword defun       defun contained
syn match paren1        .). contained
syn match paren2        .(. contained
syn match customfun     /defun\s\S\+/ contains=defun
syn match customfun2    /([^) ]\+[) ]/he=e-1,me=e-1 contains=paren2,@allfunctions,customfun

"operators   + - * / = /= < <= > >= ~ 1+ 1-
syn match operators     .\((+\s\|(-\s\|(\*\s\|(/\s\|(=\s\|(/=\s\|(<\s\|(<=\s\|(>\s\|(>=\s\|(1+\s\|(1-\s\).me=e-1,he=e-1 contains=paren2

syn region cflocalvars  start="/" end=")"me=e-1 contained
syn region customfun3   start="(defun" end=")"me=e-1 contains=paren1,paren2,customfun,cflocalvars

syn match inumbers      /-\=\d\+[) \n]/me=e-1,he=e-1
syn match inumbers      /(-\=\d\+[) \n]/me=e-1,he=e-1 contains=paren2
syn match rnumbers      /-\=\d\+\.\d\+[) \n]/me=e-1,he=e-1
syn match rnumbers      /(-\=\d\+\.\d\+[) \n]/me=e-1,he=e-1 contains=paren2

syn region vlisps       start=.(vl. end=.\s.he=e-1,me=e-1 end=.).he=e-1,me=e-1

"syn region defun2 start=.(defun. end=.^).me=e-1 contains=ALLBUT,err,paren1
"syn match defun2 ="(defun\s\S\+\s(\(\S\+\)\_.\{-}\(^)\)"
"syn match defun2 ="(defun\s\S\+\s(\(\S\+\)\_.\{-}\1"
"syn region defun2 start="(defun\s\S\+\s(\(\S\+\)" skip="\1" end="^)"me=e-1

"match as many digits as posible with or without '-'
"if not followed by a word character
"syn match inumbers  /(\=-\=\d\+\(\S\)\@!/ contains=paren2
"syn match inumbers  /\s-\=\d\+[) ]/hs=s+1,ms=s+1,me=e-1,he=e-1
"syn match rnumbers  /(\=-\=\d\+\.\d\+\(\S\)\@!/ contains=paren2
"syn match rnumbers  /\s-\=\d\+\.\d\+[) ]/hs=s+1,ms=s+1,me=e-1,he=e-1

"--------------
" COLORS
hi Normal               guibg=#181818

hi operators   	        guifg=#cc5555 gui=bold
hi func_a		guifg=#33bbff
hi link func_b func_a
hi link func_c func_a
hi link func_d func_a
hi link func_e func_a
hi link func_f func_a
hi link func_g func_a
hi link func_h func_a
hi link func_i func_a
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
hi link func_z func_a
hi link defun func_a
hi func_com		guifg=#1177ff

hi squote               guifg=#bbff66 gui=bold 
hi quotes		guifg=#ffccbb
hi link newline quotes
hi strings		guifg=#886655
hi paren                guifg=#aa7711
hi link paren1 paren
hi link paren2 paren
hi comments		guifg=#505050
hi comments2		guifg=#bbbbbb
hi comments3		guifg=#202020 guibg=#bbbbbb gui=bold
hi commentblock	        guifg=#ff4040 gui=bold
hi commentsprite        guifg=#eeff33 gui=bold
hi rnumbers             guifg=#55ffdd 
hi inumbers             guifg=#00dd33 
hi customfun            guifg=#cc99ff 
hi link customfun2 customfun
hi customfun3           guifg=#dddd99
hi cflocalvars          guifg=#88aa77
hi defun2               guifg=#ffff55 guibg=#404040
hi vlisps               guibg=DarkRed guifg=White 
"hi err                  guibg=DarkRed guifg=White   
hi variables            guifg=#ffaa77

let b:current_syntax = "autolsp"
