" Vim syntax file
" Language:   Iso-G-Sinumerik 
" Maintainer:  Robert Kiss
" Last Change: Nov 24 2014

" Description: Iso-G-Code-Sinumerik

filetype plugin on 
colorscheme xoria256
set iskeyword=48-57,65-90,95,97-122
"syn case ignore

"--------------
" Error:
syn region err          start=/\S/ end=/\s/he=e-1,me=e-1 end=/\n/
"--------------
" Functions: 
syn match Gcode         /G\d\+/
syn region cycles       start=/CYCLE/ end=/)/
syn match Mcode         /M\d\+/
syn match Mcodepoz      /M\d=3/
syn match Mcodeneg      /M\d=4/
syn keyword funcs       DIAMON DIAMOF TRANSMIT MCALL ROT
syn match funcs         /LIMS=\d\+/
syn match funcs         /SETMS(\d\+)/

"--------------
" Other: 
syn region Xpoz	        start=/X\d\+/ start=/X+\d\+/ end=/\s/ end=/\n/
syn region Xpoz	        start=/X\d\+\.\d\+/ start=/X+\d\+\.\d\+/ end=/\s/ end=/\n/
syn region Xneg	        start=/X-\d\+/ end=/\s/ end=/\n/
syn region Xneg	        start=/X-\d\+\.\d\+/ end=/\s/ end=/\n/
syn region Yall         start=/Y\d\+/ start=/Y[+-]\d\+/ end=/\s/ end=/\n/
syn region Yall         start=/Y\d\+\.\d\+/ start=/Y[+-]\d\+\.\d\+/ end=/\s/ end=/\n/
syn region Zall         start=/Z\d\+/ start=/Z[+-]\d\+/ end=/\s/ end=/\n/
syn region Zall         start=/Z\d\+\.\d\+/ start=/Z[+-]\d\+\.\d\+/ end=/\s/ end=/\n/
syn region comments	start=/;/ end=/$/
syn region Nroline     	start=/^N\d\+/ end=/\s/
syn match labels        /L\d\+/
syn match feed          /F\d\+/
syn match feed          /F\d\+\.\d\+/
syn match speed         /S\d\+/
syn match speed         /S2=\d\+/
syn match tool          /T\d\+/
syn match tool          /D\d\+/
syn match polar_rad     /RP=\d\+/
syn match polar_rad     /RP=[+-]\d\+/
syn match polar_rad     /RP=\d\+\.\d\+/
syn match polar_rad     /RP=[+-]\d\+\.\d\+/
syn match polar_anr     /\d\+/ contained
syn match polar_anr     /[+-]\d\+/ contained
syn match polar_anr     /\d\+\.\d\+/ contained
syn match polar_anr     /[+-]\d\+\.\d\+/ contained
syn match polar_ang     /AP=\d\+/ contains=polar_anr
syn match polar_ang     /AP=[+-]\d\+/ contains=polar_anr
syn match polar_ang     /AP=\d\+\.\d\+/ contains=polar_anr
syn match polar_ang     /AP=[+-]\d\+\.\d\+/ contains=polar_anr

"--------------
" Colors:
hi link err             Error

hi link Gcode           MoreMsg
hi link cycles          PreProc
hi link Mcode           Statement
hi link Mcodepoz        Xpoz
hi link Mcodeneg        Xneg
hi link funcs           Constant

hi link Xpoz            Directory
hi link Xneg            CursorLineNr
hi link Yall            SpecialKey
hi link Zall            Question
hi link comments        NonText
hi link Nroline         ModeMsg
hi link labels          Underlined
hi link feed            Identifier
hi link speed           Special
hi link tool            Underlined
hi link polar_rad       Underlined
hi link polar_anr       PreProc
hi link polar_ang       SpecialKey


let b:current_syntax = "isogsinumerik"
" vim:sw=4
