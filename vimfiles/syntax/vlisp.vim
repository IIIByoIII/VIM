" Vim syntax file
" Language:    Visual Lisp
" Maintainer:  ing Kiss Robert
" Last Change: May 03, 2013
" Description: Visual Lisp Syntax

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
syn keyword func_a	abs acad_colordlg acad_helpdlg acad_strlsort acdimenableupdate acet-attsync acet-layerp-mode acet-layerp-mark acet-laytrans acet-ms-to-ps acet-ps-to-ms action_tile add_list alert alloc and angle angtof angtos append apply arx arxload arxunload ascii assoc atan atof atoi atom atoms-family autoarxload autoload 
syn keyword func_b	Boole boundp
syn keyword func_c	caddr cadr car cdr chr client_data_tile close cond cons cos cvunit
syn keyword func_com    command
syn keyword func_d	defun-q defun-q-list-ref defun-q-list-set dictadd dictnext dictremove dictrename dictsearch dimx_tile dimy_tile distance distof done_dialog
syn keyword func_e	end_image end_list entdel entget entlast entmake entmakex entmod entnext entsel entupd eq equal error_function (*error*) eval exit exp expand expt
syn keyword func_f	fill_image findfile fix float foreach function
syn keyword func_g	gc gcd get_attr get_tile getangle getcfg getcname getcorner getdist getenv getfiled getint getkword getorient getpoint getreal getstring getvar graphscr grclear grdraw grread grtext grvecs
syn keyword func_h	handent help
syn keyword func_i	if initdia initget inters itoa
syn keyword func_l	lambda last layoutlist length list listp load load_dialog log logand logior lsh
syn keyword func_m	mapcar max mem member menucmd menugroup min minusp mode_tile
syn keyword func_n	nil namedobjdict nentsel nentselp new_dialog not nth null numberp
syn keyword func_o	open or osnap
syn keyword func_p	polar prin1 princ print progn prompt
syn keyword func_q	quit quote
syn keyword func_r	read read-char read-line redraw regapp rem repeat reverse rtos
syn keyword func_s	set set_tile setcfg setenv setfunhelp setq setvar setview sin slide_image snvalid sqrt ssadd ssdel ssget ssgetfirst sslength ssmemb ssname ssnamex sssetfirst startapp start_dialog start_image start_list strcase strcat strlen subst substr
syn keyword func_t	T t tablet tblnext tblobjname tblsearch term_dialog terpri textbox textpage textscr trace trans type
syn keyword func_u	unload_dialog untrace                                               
syn keyword func_v	vector_image ver vl-acad-defun vl-acad-undefun vl-arx-import vl-bb-ref vl-bb-set vl-catch-all-apply vl-catch-all-error-message vl-catch-all-error-p vl-cmdf vl-consp vl-copyobjects vl-directory-files vl-doc-export vl-doc-import vl-doc-ref vl-doc-set vl-every vl-exit-with-error vl-exit-with-value vl-file-copy vl-file-delete vl-file-directory-p vl-file-rename vl-file-size vl-file-systime vl-filename-base vl-filename-directory vl-filename-extension vl-filename-mktemp vl-get-resource vl-list_star (vl-list*) vl-list->string vl-list-exported-functions vl-list-length vl-list-loaded-vlx vl-load-all vl-load-com vl-load-reactors vl-member-if vl-member-if-not vl-position vl-prin1-to-string vl-princ-to-string vl-propagate vl-registry-delete vl-registry-descendents vl-registry-read vl-registry-write vl-remove vl-remove-if vl-remove-if-not vl-some vl-sort vl-sort-i vl-string->list vl-string-elt vl-string-left-trim vl-string-mismatch vl-string-position vl-string-right-trim vl-string-search vl-string-subst vl-string-translate vl-string-trim vl-symbol-name vl-symbol-value vl-symbolp vl-unload-vlx vl-vbaload vl-vbarun vl-vlx-loaded-p vlax-3D-point vlax-add-cmd vlax-create-object vlax-curve-getArea vlax-curve-getClosestPointTo vlax-curve-getClosestPointToProjection vlax-curve-getDistAtParam vlax-curve-getDistAtPoint vlax-curve-getEndParam vlax-curve-getEndPoint vlax-curve-getFirstDeriv vlax-curve-getParamAtDist vlax-curve-getParamAtPoint vlax-curve-getPointAtDist vlax-curve-getPointAtParam vlax-curve-getSecondDeriv vlax-curve-getStartParam vlax-curve-getStartPoint vlax-curve-isClosed vlax-curve-isPeriodic vlax-curve-isPlanar vlax-dump-object vlax-ename->vla-object
syn keyword func_v2	vlax-erased-p vlax-for vlax-get-acad-object vlax-get-object vlax-get-or-create-object vlax-get-property vlax-import-type-library vlax-invoke-method vlax-ldata-delete vlax-ldata-get vlax-ldata-list vlax-ldata-put vlax-ldata-test vlax-make-safearray vlax-make-variant vlax-map-collection vlax-method-applicable-p vlax-object-released-p vlax-product-key vlax-property-available-p vlax-put-property vlax-read-enabled-p vlax-release-object vlax-remove-cmd vlax-safearray-fill vlax-safearray-get-dim vlax-safearray-get-element vlax-safearray-get-l-bound vlax-safearray-get-u-bound vlax-safearray-put-element vlax-safearray-type vlax-safearray->list vlax-tmatrix vlax-typeinfo-available-p vlax-variant-change-type vlax-variant-type vlax-variant-value vlax-vla-object->ename vlax-write-enabled-p vlisp-compile vlr-acdb-reactor vlr-add vlr-added-p vlr-beep-reaction vlr-command-reactor vlr-current-reaction-name vlr-data vlr-data-set vlr-deepclone-reactor vlr-docmanager-reactor vlr-dwg-reactor vlr-dxf-reactor vlr-editor-reactor vlr-insert-reactor vlr-linker-reactor vlr-lisp-reactor vlr-miscellaneous-reactor vlr-mouse-reactor vlr-notification vlr-object-reactor vlr-owner-add vlr-owner-remove vlr-owners vlr-pers vlr-pers-list vlr-pers-p vlr-pers-release vlr-reaction-name vlr-reaction-set vlr-reactions vlr-reactors vlr-remove vlr-remove-all vlr-set-notification vlr-sysvar-reactor vlr-toolbar-reactor vlr-trace-reaction vlr-type vlr-types vlr-undo-reactor vlr-wblock-reactor vlr-window-reactor vlr-xref-reactor vports
syn keyword func_w	wcmatch while write-char write-line
syn keyword func_x	xdroom xdsize
syn keyword func_z	zerop
syn cluster allfunctions contains=func_a,func_b,func_c,func_d,func_e,func_f,func_g,func_h,func_i,func_l,func_m,func_n,func_o,func_p,func_q,func_r,func_s,func_t,func_u,func_v,func_v2,func_w,func_x,func_z,func_com,operators 

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
hi func_a		        guifg=#33bbff
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
hi link func_v2 func_a
hi link func_w func_a
hi link func_x func_a
hi link func_z func_a
hi link defun func_a
hi func_com		        guifg=#1177ff

hi squote               guifg=#bbff66 gui=bold 
hi quotes		        guifg=#ffccbb
hi link newline quotes
hi strings		        guifg=#886655
hi paren                guifg=#aa7711
hi link paren1 paren
hi link paren2 paren
hi comments		        guifg=#505050
hi comments2		    guifg=#bbbbbb
hi comments3		    guifg=#202020 guibg=#bbbbbb gui=bold
hi commentblock	        guifg=#ff4040 gui=bold
hi commentsprite        guifg=#eeff33 gui=bold
hi rnumbers             guifg=#55ffdd 
hi inumbers             guifg=#00dd33 
hi customfun            guifg=#cc99ff 
hi link customfun2 customfun
hi customfun3           guifg=#dddd99
hi cflocalvars          guifg=#88aa77
hi defun2               guifg=#ffff55 guibg=#404040
"hi err                  guibg=DarkRed guifg=White   
hi variables            guifg=#ffaa77

let b:current_syntax = "vlsp"
