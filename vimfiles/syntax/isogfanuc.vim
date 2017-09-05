" Vim syntax file
" Language:   Iso-G-Code 
" Maintainer:  Dan Turcu & Robert Kiss
" Last Change: Sun Oct 24 2004 7:11:50 PM
" Version:     1.0.0.0

" Description: Iso-G-Code-Fanuc

"if version < 600
"    syntax clear
"elseif exists("b:current_syntax")
"    finish
"endif

"colorscheme pablo

"syn case ignore


"--------------
"Line Number
call cursor(1,1) 
"s/^\(N\d\+\)\s\+//ge 9999
"g/^/exec "s/^/N".strpart(line(".")."0 ", 0, 6)
"--------------
"ERROR
syn region err	start=/\S/ end=/\s/he=e-1,me=e-1 end=/\n/

"--------------
"KEYWORDS 
syn region Gcode	start=/G\d/ end=/\d/ end=/\a/he=e-1,me=e-1 end=/\s/ end=/\n/

syn keyword G42	G42
syn keyword G41	G41
syn keyword G40	G40
syn keyword G0	G0 , G00
syn keyword G1	G1 , G01
syn keyword G2_3	G2 , G02 , G3 , G03 , G12 , G13
syn keyword G17	G17
syn keyword G18	G18
syn keyword G19	G19
syn keyword G90	G90 , G91
syn match hQ    'G\d\+[.]\d\+'

"--------------
"REGIONS
syn region gpercent	start=/%/ end=/\a/he=e-1,me=e-1 end=/\n/
syn region pgm		start=/O\d/ end=/\d\+/ end=/\a/he=e-1,me=e-1
syn region Comment	start=/(/ end=/)/
syn region gnr 	start=/#\d/ start=/G#\d/ end=/\a/he=e-1,me=e-1 end=/\s/he=e-1,me=e-1 end=/\n/
"--------------------------------------------
syn region X	start=/X/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region Y	start=/Y/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region Z	start=/Z/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region A	start=/A/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region B	start=/B/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region C	start=/C/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region U	start=/U/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region V	start=/V/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region W	start=/W/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region I	start=/I/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region J	start=/J/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region K	start=/K/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
"--------------------------------------------
syn region M	start=/M\d/ end=/\a/he=e-1,me=e-1 end=/\d\+/ end=/\s/ end=/\n/
syn region H	start=/H\d\+/ end=/\S/he=e-1,me=e-1 end=/\s/ end=/\n/
syn region S	start=/S\d/ end=/\a/he=e-1,me=e-1 end=/\d\+/ end=/\s/ end=/\n/
syn region F	start=/F\d/ end=/\a/he=e-1,me=e-1 end=/\d\+/ end=/\s/ end=/\n/
syn region P	start=/P\d/ end=/\a/he=e-1,me=e-1 end=/\d\+/ end=/\s/ end=/\n/
syn region T	start=/T\d/ end=/\a/he=e-1,me=e-1 end=/\d\+/ end=/\s/ end=/\n/
syn region R	start=/R/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region Q	start=/Q/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region D	start=/D/ skip=/[,.]/ end=/\a/he=e-1,me=e-1 end=/\d\+\s/ end=/[+-]\d\+\s/ end=/[+-]\s/he=e-2,me=e-2 end=/\n/
syn region G52_9	start=/G5/ end=/\S/he=e-1,me=e-1 end=/\s/ end=/\n/ end=/[2-9]/
syn keyword G50_1	G50 , G51
syn region G80_4	start=/G8/ end=/\S/he=e-1,me=e-1 end=/\s/ end=/\n/ end=/[0-4]/
syn keyword G85_9	G85 , G86 , G87 , G88 , G89
syn region N		start=/N/ end=/\d\+/ end=/\n/

"--------------
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_h_syn_inits")
	if version < 508
        	let did_h_syn_inits = 1
        	command -nargs=+ HiLink hi link <args>
	else
        	command -nargs=+ HiLink hi def link <args>
	endif


hi gpercent	ctermfg=magenta guifg=#ffffff 	cterm=none
hi Comment	ctermfg=grey 	guifg=#995500 	cterm=none
hi pgm		ctermfg=Yellow 	guifg=#9966ff 	cterm=none
hi gnr	 	ctermfg=Yellow 	guifg=#9966ff 	cterm=none
hi H		ctermfg=magenta guifg=#ff22ff 	guibg=#222222	cterm=none
hi M		ctermfg=brown 	guifg=#337700 	cterm=none
hi N		ctermfg=brown 	guifg=#777777 	cterm=none
hi X		ctermfg=cyan 	guifg=#88ccff 	cterm=none
hi G19		ctermfg=cyan 	guifg=#88ccff 	cterm=none
hi Y		ctermfg=green 	guifg=#88ff33 	cterm=none
hi G18		ctermfg=green 	guifg=#88ff33 	cterm=none
hi Z		ctermfg=red 	guifg=#ffaa00 	cterm=none
hi G17		ctermfg=red 	guifg=#ffaa00 	cterm=none
hi A		ctermfg=cyan 	guifg=#88ccff 	guibg=#222222	cterm=none
hi B		ctermfg=green 	guifg=#88ff33 	guibg=#222222	cterm=none
hi C		ctermfg=red 	guifg=#ffaa00 	guibg=#222222	cterm=none
hi U		ctermfg=cyan 	guifg=#88ccff 	guibg=#222222	cterm=none
hi V		ctermfg=green 	guifg=#88ff33 	guibg=#222222	cterm=none
hi W		ctermfg=red 	guifg=#ffaa00 	guibg=#222222	cterm=none
hi S		ctermfg=magenta guifg=#ff5500 	cterm=none
hi F		ctermfg=blue	guifg=#0066cc 	cterm=none
hi I		ctermfg=brown 	guifg=#00ffff 	cterm=none
hi J		ctermfg=brown 	guifg=#00aa00 	cterm=none
hi K		ctermfg=brown 	guifg=#ffff55 	cterm=none
hi R		ctermfg=brown 	guifg=#779977 	cterm=none
hi P		ctermfg=Yellow 	guifg=#9966ff 	cterm=none
hi Q		ctermfg=brown 	guifg=#bb7777 	cterm=none
hi T		ctermfg=magenta guifg=#ff5500 	cterm=none
hi D		ctermfg=brown 	guifg=#ff5533 	cterm=none
hi G1		ctermfg=magenta guifg=#888888 	cterm=none
hi G42		ctermfg=brown 	guifg=#cccccc 	guibg=#222222	cterm=none
hi G41		ctermfg=brown 	guifg=#888888 	guibg=#222222	cterm=none
hi G40		ctermfg=brown 	guifg=#ffaaff 	guibg=#222222	cterm=none
hi G2_3		ctermfg=brown 	guifg=#ff5533 	cterm=none
hi G0		ctermfg=brown 	guifg=#ffffaa 	cterm=none
hi G52_9	ctermfg=Yellow 	guifg=#9966ff 	cterm=none
hi G80_4	ctermfg=Yellow 	guifg=#9966ff 	cterm=none
hi Gcode	ctermfg=magenta guifg=#ff55dd 	cterm=none
hi G50_1	ctermfg=magenta guifg=#ff55dd 	cterm=none
hi G85_9	ctermfg=magenta guifg=#ff55dd 	cterm=none
hi G90		ctermfg=magenta guifg=#cccccc 	cterm=none
hi err term=standout ctermbg=Red ctermfg=White guibg=Red guifg=White

delcommand HiLink
endif
let b:current_syntax = "g"
" vim:sw=4
