" Vim syntax file
" Language:    Todo files
" Maintainer:  Robert Kiss
" Last Change: 2025-12-01
" Description: Tree structure and color coded tasks
"
" =========
" Settings:
" =========
filetype plugin on
"colorscheme xoria256
"set iskeyword=33-126
"WARNING: Modifying the default iskeyword
syn case ignore
"see ftplugin todofiles.vim for fold method

" =======
" Syntax:
" =======
syn match other         '.'

syn match indent0       '^\S.*$'
syn match indent1       '^\s\{1,2}.*$'
syn match indent2       '^\s\{3,4}.*$'
syn match indent3       '^\s\{5,6}.*$'
syn match indent4       '^\s\{7,8}.*$'
syn match indent5       '^\s\{9,10}.*$'
syn match indent6       '^\s\{11,12}.*$'
syn match indent7       '^\s\{13,14}.*$'
syn match indent8       '^\s\{15,16}.*$'
syn match indent9       '^\s\{17,}.*$'

syn match stuckline     '^.\+\[stuck\]'
syn match doneline      '^.\+\[done.\+\]'
syn match doingline     '^.\+\[doing\]'
syn match maybeline     '^.\+\[maybe?\]'

syn region comments1    start=.\s\{};. end=.$.
syn region comments2    start=.\s\{};;. end=.$.
syn region comments3    start=.\s\{};;;. end=.$.

" =======
" Colors:
" =======
hi indent0              guifg=#eecccc gui=bold
hi indent1              guifg=#bb9999 gui=bold
hi indent2              guifg=#886666 gui=bold
hi indent3              guifg=#553333 gui=bold
hi indent4              guifg=#eecccc gui=bold
hi indent5              guifg=#bb9999 gui=bold
hi indent6              guifg=#886666 gui=bold
hi indent7              guifg=#553333 gui=bold
hi indent8              guifg=#eecccc gui=bold
hi indent9              guifg=#886666 gui=bold

"hi indent0              guifg=#efefcf gui=bold
"hi indent1              guifg=#dfdfbf gui=bold
"hi indent2              guifg=#cfcfaf gui=bold
"hi indent3              guifg=#bfbf9f gui=bold
"hi indent4              guifg=#afaf8f gui=bold
"hi indent5              guifg=#9f9f7f gui=bold
"hi indent6              guifg=#8f8f6f gui=bold
"hi indent7              guifg=#7f7f5f gui=bold
"hi indent8              guifg=#6f6f4f gui=bold
"hi indent9              guifg=#5f5f3f gui=bold

hi link stuckline       SrceryMagenta
hi link doneline        SrceryGreenBold
hi link doingline       SrceryYellow
hi link maybeline       SrceryBlue

hi link other           Normal

hi link comments1       Comment
hi link comments2       CursorLine
hi link comments3       Cursor
" ====
" End:
" ====
let b:current_syntax = "todofiles"
