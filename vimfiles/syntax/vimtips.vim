" Vim syntax file
" Language:    Vimtips files
" Maintainer:  Robert Kiss
" Last Change: Oct 5 2015
" Description: Some useful information about using vim
" =========
" Settings:
" =========
filetype plugin on 
"colorscheme xoria256
set iskeyword=33-126
syn case ignore
" =======
" Syntax:
" =======

syn match defcolor      /./ contains=nm
syn region comments1    start=.^". end=.$. contains=nm
syn region comments2    start=.:\s\S. end=.$. contains=nm
syn region comments3    start=.^\d). end=.$. contains=nm
syn match nm            .\[N\]. "new and modified
syn match nm            .\[C\]. "new and modified

" =======
" Colors:
" =======

hi link defcolor        Comment
hi link comments1       Statement
hi link comments2       Special
hi link comments3       Constant
hi link nm              Question

" ====
" End:
" ====
let b:current_syntax = "vimtips"
" vim:sw=4
