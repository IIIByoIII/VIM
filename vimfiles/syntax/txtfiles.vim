" Vim syntax file
" Language:    Text files
" Maintainer:  Robert Kiss
" Last Change: 2020-10-02
" Description: Just plain information in a text file
" =========
" Settings:
" =========
filetype plugin on
"colorscheme xoria256
"set iskeyword=33-126
"WARNING: Modifying the default iskeyword
" may disable some vim help functions like (Shift+k) and (Ctrl+])
syn case ignore
" =======
" Syntax:
" =======
syn match other         '.'
syn region paren1       start='(' end=')' end='$'
syn region paren2       start='\[' end='\]' end='$'
syn region paren3       start='{' end='}' end='$'
syn match indent0       '^\S.*$' contains=paren1,paren2,paren3
syn match indent1       '^\s\{1,2}.*$' contains=paren1,paren2,paren3
syn match indent2       '^\s\{3,4}.*$' contains=paren1,paren2,paren3
syn match indent3       '^\s\{5,6}.*$' contains=paren1,paren2,paren3
syn match indent4       '^\s\{7,8}.*$' contains=paren1,paren2,paren3
syn match indent5       '^\s\{9,}.*$' contains=paren1,paren2,paren3
syn match colon         '.*:' contains=paren1,paren2,paren3
"syn match dash          '^\s*-.*$' contains=paren1,paren2,paren3,dash_
"syn match hashtag       '^\s*#.*$' contains=paren1,paren2,paren3,hashtag_
"syn match plus          '^\s*+.*$' contains=paren1,paren2,paren3,plus_

syn region comments1    start=.\s\{};. end=.$.
syn region comments2    start=.\s\{};;. end=.$.
syn region comments3    start=.\s\{};;;. end=.$.

" =======
" Colors:
" =======
hi link paren1          SrceryBlue
hi link paren2          SrceryOrange
hi link paren3          SrceryBrightMagenta

hi link colon           Todo
hi link indent0         SrceryCyan
hi link indent1         SrceryBrightGreen
hi link indent2         SrceryYellow
hi link indent3         SrceryRed
hi link indent4         SrceryBrightBlue
hi link indent5         Normal
hi link other           Comment

hi link comments1       Comment
hi link comments2       CursorLine
hi link comments3       Cursor
" ====
" End:
" ====
let b:current_syntax = "txtfiles"
" vim:sw=4
