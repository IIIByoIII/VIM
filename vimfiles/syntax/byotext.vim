" Vim syntax file
" Language:    ByoText files
" Maintainer:  Robert Kiss
" Last Change: Nov 27 2014
" Description: Just plain information in a text file
" =========
" Settings:
" =========
filetype plugin on 
colorscheme xoria256
set iskeyword=33-126
syn case ignore
" =======
" Syntax:
" =======
syn match ignored       .\(á\|ó\|ä\|æ\|ç\|ú\|ø\|ã\|ö\). contained
" Alt + a,s,d,f,g,z,x,c,v = á,ó,ä,æ,ç,ú,ø,ã,ö
syn match type1         '[!@#$%\^&*{}\[\]()-=_+~\\/<>,.|0-9a-zA-Z]\+á' contains=ignored
syn match type2         '[!@#$%\^&*{}\[\]()-=_+~\\/<>,.|0-9a-zA-Z]\+ó' contains=ignored
syn match type3         '[!@#$%\^&*{}\[\]()-=_+~\\/<>,.|0-9a-zA-Z]\+ä' contains=ignored
syn match type4         '[!@#$%\^&*{}\[\]()-=_+~\\/<>,.|0-9a-zA-Z]\+æ' contains=ignored
syn match type5         '[!@#$%\^&*{}\[\]()-=_+~\\/<>,.|0-9a-zA-Z]\+ç' contains=ignored
syn match type6         '[!@#$%\^&*{}\[\]()-=_+~\\/<>,.|0-9a-zA-Z]\+ú' contains=ignored
syn match type7         '[!@#$%\^&*{}\[\]()-=_+~\\/<>,.|0-9a-zA-Z]\+ø' contains=ignored
syn match type8         '[!@#$%\^&*{}\[\]()-=_+~\\/<>,.|0-9a-zA-Z]\+ã' contains=ignored
syn match type9         '[!@#$%\^&*{}\[\]()-=_+~\\/<>,.|0-9a-zA-Z]\+ö' contains=ignored
syn match type10        /[(){}]\+/

syn region comments1    start=.;. end=.$.
syn region comments2    start=.;;. end=.$.
syn region comments3    start=.;;;. end=.$.


" =======
" Colors:
" =======
hi link ignored         Ignore
hi link type1           Constant     
hi link type2           Special     
hi link type3           Identifier     
hi link type4           Statement     
hi link type5           PreProc     
hi link type6           Type     
hi link type7           Underlined     
hi link type8           Number     
hi link type9           WarningMsg     
hi link type10          WildMenu

hi link comments1       Comment
hi link comments2       CursorLine
hi link comments3       lCursor
" ====
" End:
" ====
let b:current_syntax = "byotext"
" vim:sw=4
