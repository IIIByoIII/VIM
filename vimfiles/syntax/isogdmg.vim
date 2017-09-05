" Vim syntax file
" Language:   Iso-G-DMG 
" Maintainer:  Robert Kiss
" Last Change: Mon Dec 9 2013

" Description: Iso-G-Code-DMG

"if version < 600
"    syntax clear
"elseif exists("b:current_syntax")
"    finish
"endif

filetype plugin on 
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

"--------------
"REGIONS
syn region gpercent	start=/%/ end=/\a/he=e-1,me=e-1 end=/\n/
syn region pgm		start=/O\d/ end=/\d\+/ end=/\a/he=e-1,me=e-1
syn region Comment	start=/;/ end=/$/
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

"--------------------------------------------
syn region MSG          start=/MSG(/ end=/)/
syn region Mx           start=/M\d\+(/ end=/)/
syn region DEF	        start=/DEF/ end=/$/
syn region Dollar       start=/\$/ end=/$/
syn keyword MCall	MCALL STOPRE L_FREI
syn region Cycle        start=/CYCLE/ end=/)/
"--------------------------------------------

"--------------
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
"if version >= 508 || !exists("did_h_syn_inits")
"	if version < 508
"        	let did_h_syn_inits = 1
"        	command -nargs=+ HiLink hi link <args>
"	else
"        	command -nargs=+ HiLink hi def link <args>
"	endif

hi Mx		guifg=#777700
hi MSG          guifg=#bb9900
hi DEF          guifg=#0088ee
hi Dollar       guifg=#0044aa
hi MCall        guifg=#ee3300
hi Cycle        guifg=#bb3366

hi gpercent	guifg=#ffffff
hi Comment	guifg=#995500
hi pgm		guifg=#9966ff
hi gnr	 	guifg=#9966ff
hi H		guifg=#ff22ff 	guibg=#222222	
hi M		guifg=#337700
hi N		guifg=#777777
hi X		guifg=#88ccff
hi G19		guifg=#88ccff
hi Y		guifg=#88ff33
hi G18		guifg=#88ff33
hi Z		guifg=#ffaa00
hi G17		guifg=#ffaa00
hi A		guifg=#88ccff 	guibg=#222222
hi B		guifg=#88ff33 	guibg=#222222
hi C		guifg=#ffaa00 	guibg=#222222
hi U		guifg=#88ccff 	guibg=#222222
hi V		guifg=#88ff33 	guibg=#222222
hi W		guifg=#ffaa00 	guibg=#222222
hi S		guifg=#ff5500
hi F		guifg=#0066cc
hi I		guifg=#00ffff
hi J		guifg=#00aa00
hi K		guifg=#ffff55
hi R		guifg=#779977
hi P		guifg=#9966ff
hi Q		guifg=#bb7777
hi T		guifg=#ff5500
hi D		guifg=#ff5533
hi G1		guifg=#888888
hi G42		guifg=#cccccc 	guibg=#222222
hi G41		guifg=#888888 	guibg=#222222
hi G40		guifg=#ffaaff 	guibg=#222222
hi G2_3		guifg=#ff5533
hi G0		guifg=#ffffaa
hi G52_9	guifg=#9966ff
hi G80_4	guifg=#9966ff
hi Gcode	guifg=#ff55dd
hi G50_1	guifg=#ff55dd
hi G85_9	guifg=#ff55dd
hi G90		guifg=#cccccc
hi err term=standout ctermbg=Red ctermfg=White guibg=Red guifg=White

"delcommand HiLink
"endif
let b:current_syntax = "g"
" vim:sw=4
