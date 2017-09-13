" Basic Settings:
" {{{
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
colorscheme byosrcery
"colorscheme xoria256
"set guifont=Courier10\ BT:h11
set guifont=Consolas:h10.5
set encoding=utf-8
setglobal fileencoding=utf-8
"set fileencodings=ucs-bom,utf-8,latin1

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on
" }}}

" Autocommands:
" {{{
" au = autocmd
augroup filetypes  
  "to clear the group before loading
  autocmd!
  au BufRead,BufNewFile *.h set filetype=heidenhain
  au BufRead,BufNewFile *.h~ set filetype=heidenhain
  au BufRead,BufNewFile *.lsp set filetype=vlisp
  au BufRead,BufNewFile *.lsp~ set filetype=vlisp
  au BufRead,BufNewFile *.dcl set filetype=vdcl
  au BufRead,BufNewFile *.dcl~ set filetype=vdcl
  au BufRead,BufNewFile *.gpp set filetype=gpp
  au BufRead,BufNewFile *.gpp~ set filetype=gpp
  au BufRead,BufNewFile *.mpf set filetype=isogsinumerik
  au BufRead,BufNewFile *.mpf~ set filetype=isogsinumerik
  au BufRead,BufNewFile *.spf set filetype=isogsinumerik
  au BufRead,BufNewFile *.spf~ set filetype=isogsinumerik
  au BufRead,BufNewFile *.byo set filetype=byotext
  au BufRead,BufNewFile *.byo~ set filetype=byotext
  au BufRead,BufNewFile *.r set filetype=rebyol
  au BufRead,BufNewFile *.r~ set filetype=rebyol
  au BufRead,BufNewFile *.r3 set filetype=rebyol3
  au BufRead,BufNewFile *.r3~ set filetype=rebyol3
  au BufRead,BufNewFile *.vimtips set filetype=vimtips
  au BufRead,BufNewFile *.vimtips~ set filetype=vimtips
  "au BufRead,BufNewFile *.cs set filetype=cbyosharp
  "au BufRead,BufNewFile *.cs~ set filetype=cbyosharp
augroup END

  "this function removes a character of your choice (I don't really understand it)
  "you can view more about this function by typing :helpgrep Eatchar
  "use after abbreviations by adding this "<c-r>=Eatchar('\s')<cr>" at the end
func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

augroup csharp
  "to clear the group before loading
  autocmd!
  au FileType cs :iabbrev <buffer> forr for (int i = 0; i < ; i++)<esc>4hi<c-r>=Eatchar('\m\s\<bar>/')<cr>
  au FileType cs :iabbrev <buffer> iff if ()<esc>i<c-r>=Eatchar('\m\s\<bar>/')<cr>
  au FileType cs :iabbrev <buffer> {} {}<esc>i<return><esc><S-O><c-r>=Eatchar('\m\s\<bar>/')<cr>
  au FileType cs setlocal shiftwidth=4 tabstop=4
  au FileType cs setlocal foldmarker=cs,ce
augroup END
" For help tags run the command :helptags $vim/vim73/doc
" Also if you have any help files make sure to put them there
" }}}

" Set:
" {{{
"set verbose=0
"set cmdheight=2        "command line height
"set smartindent        "or cindent for c type languages
"set tabstop=4          "lenght of tab
"set shiftwidth=4       "number of spaces to use when indenting
"set expandtab          "transform tabs to spaces

    " === Set directory of backup files ===
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.
set undodir=~/vimtmp,.

    " === Auto fold code using markers (default {{{}}}) ===
set foldmethod=marker
set foldmarker={{{,}}} "force the default marker
    " to create fold select code visually and press "zf"
"set foldmethod=indent

    " === Pathogen plugin installer. ===
"call pathogen#infect()

    " === Tabstops and other cosmetics ===
set tabstop=4
set shiftwidth=0
set softtabstop=0
set smarttab
set expandtab
set autoindent

    " === Set the search scan to wrap lines ===
set wrapscan

    " === I'm happy to type the case of things.
    " I tried the ignorecase, smartcase
    " thing but it just wasn't working out for me ===
set noignorecase

    " === Make command line two lines high ===
set ch=2

    " === set visual bell -- i hate that damned beeping ===
set vb

    " === Allow backspacing over indent, eol, and the start of an insert ===
set backspace=2

    " === Make sure that unsaved buffers that are to be put in the background are
    " allowed to go in there (ie. the "must save first" error doesn't come up) ===
set hidden

    " === Make the 'cw' and like commands put a $ at the end instead of just deleting
    " the text and replacing it ===
set cpoptions=ces$

    " === tell VIM to always put a status line in, even if there is only one window ===
set laststatus=2

    " === Don't update the display while executing macros ===
set lazyredraw

    " === Show the current mode ===
set showmode

    " === Switch on syntax highlighting. ===
syntax on

    " === Hide the mouse pointer while typing ===
set mousehide

    " === Set up the gui cursor to look nice ===
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

    " === set the gui options the way I like ===
set guioptions=acgml
"set guioptions=acg

    " === This is the timeout used while waiting for user input on a multi-keyed macro
    " or while just sitting and waiting for another key to be pressed measured
    " in milliseconds.
    "
    " i.e. for the ",d" command, there is a "timeoutlen" wait period between the
    "      "," key and the "d" key.  If the "d" key isn't pressed before the
    "      timeout expires, one of two things happens: The "," command is executed
    "      if there is one (which there isn't) or the command aborts. ===
set timeoutlen=500

    " === Keep some stuff in the history ===
set history=100

    " === These commands open folds ===
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

    " === When the page starts to scroll, keep the cursor 8 lines from the top and 8
    " lines from the bottom ===
set scrolloff=8

    " === Allow the cursor to go in to "invalid" places ===
set virtualedit=all

    " === Disable encryption (:X) ===
set key=

    " === Make the command-line completion better ===
set wildmenu

    " === Same word completion as default except that I remove the 'u' option ===
set complete=.,w,b,t

    " === When completing by tag, show the whole tag, not just the function name ===
set showfulltag

    " === Set the textwidth to be 80 chars ===
set textwidth=0

    " === get rid of the silly characters in separators ===
set fillchars = ""

    " === Add ignorance of whitespace to diff ===
set diffopt+=iwhite

    " === Enable search highlighting ===
set hlsearch

    " === Incrementally match the search ===
set incsearch

    " === Add the unnamed register to the clipboard ===
set clipboard+=unnamed

    " === Trying out the line numbering thing... never liked it, but that doesn't mean
    " I shouldn't give it another go :) ===
"set relativenumber

    " === Syntax coloring lines that are too long just slows down the world ===
set synmaxcol=2048

    " === Highlight the current line and column
    " Don't do this - It makes window redraws painfully slow ===
set nocursorline
set nocursorcolumn

    " === Disable mouse ===
"set mouse=

    " === Set the color for column <nr> ===
set colorcolumn=80

    " === Toggle relative and current line number with reload ===
set nu!
set rnu!

    " === Disable ALT for menu ===
set winaltkeys=no

    " === Disable text wraping ===
set nowrap     
" }}}

" Let:
" {{{
    " === I don't like it when the matching parens are automatically highlighted ===
"let loaded_matchparen = 1

    " === System default for mappings is now the "," character ===
let mapleader = ","
" }}}

" Map:
" {{{
    " XXX === "ALT key combinations" === {{{

    " === Highlight current word ===
"nnoremap <F8> :let @/='\\<<C-R>=expand("<cword>")<CR>\\>'<CR>:set hls<CR>
nnoremap <M-8> *N

    " === Make hjkl movements accessible from command mode ===
cnoremap <M-h> <left>
cnoremap <M-j> <down>
cnoremap <M-k> <up>
cnoremap <M-l> <right>

    " === Make hjkl movements accessible from insert mode via the <Alt> modifier key ===
"inoremap <M-h> <C-o>h
"inoremap <M-l> <C-o>l
inoremap <M-h> <left>
inoremap <M-j> <C-o>gj
inoremap <M-k> <C-o>gk
inoremap <M-l> <right>

    " === Make word movements accessible from insert mode via the <Alt> modifier key ===
inoremap <M-b> <C-o>b
inoremap <M-B> <C-o>B
inoremap <M-e> <C-o>e<C-o>l
inoremap <M-E> <C-o>E<C-o>l
inoremap <M-w> <C-o>w
inoremap <M-W> <C-o>W

    " === Use ALT-E and ALT-R to replace the original ';' and ',' mapping (repeat last f, t, F or T) ===
nnoremap <M-e> ;
nnoremap <M-r> ,

    " === Jump back and forth to brackets ===
nnoremap <M-u> ?)<cr>:nohls<cr>
nnoremap <M-p> /)<cr>:nohls<cr>
nnoremap <M-h> ?(<cr>:nohls<cr>
nnoremap <M-l> /(<cr>:nohls<cr>
nnoremap <M-m> %

    " === Jump next or previous start or end of line ===
nnoremap <M-i> gj$
nnoremap <M-o> gk$
nnoremap <M-j> gj^
nnoremap <M-k> gk^

    " === Set the next and previous buffer to keys ===
nnoremap <M-]> :bn<cr>
nnoremap <M-[> :bp<cr>

    " === Set wrap toggle to button ===
nnoremap <silent> <M-w> :set wrap!<cr>

    " === Do not highlight search ===
nnoremap <M-\> :nohls<cr>

    " === Close previous bracket automaticaly on its column on the line below cursor ===
nnoremap <M-n> A)<esc>%:let crtcol = col(".")<cr>%xo<esc>:let crtlin = line(".")<cr>:call cursor(crtlin, crtcol)<cr>i)<esc>
inoremap <M-n> <esc>A)<esc>%:let crtcol = col(".")<cr>%xo<esc>:let crtlin = line(".")<cr>:call cursor(crtlin, crtcol)<cr>i)
" }}}

    " XXX === "CTRL key combinations" === {{{

    " === Make horizontal scrolling easier ===
nnoremap <silent> <C-o> 4zl
nnoremap <silent> <C-i> 4zh

    " === Use <C-b> instead of <C-p> to move backward in the completion list (insert mode) ===
inoremap <C-b> <C-p>

    " === Use <C-p> to paste yanked stuff (insert mode) ===
inoremap <C-p> <esc>pa

    " === Set <C-h> to delete character befor cursor ===
nnoremap <C-h> X

    " === Set <C-l> as delete in insert and command mode ===
inoremap <C-l> <C-o>x
cnoremap <C-l> <del>

    " === Insert new blank line above and below the cursor ===
nnoremap <C-j> o<esc>
nnoremap <C-k> O<esc>

    " === Change case of word using Ctrl+c ===
nnoremap <C-c> mlviw~`l
inoremap <C-c> <esc>mlviw~`la
vnoremap <C-c> <esc>mlviw~`lv
" }}}

    " XXX === "Leader key combitations" === {{{

    " === Load Heidenhain and VLisp syntaxes ===
nnoremap <silent> <leader>sv :so $Vim/\vim73/\syntax/\vlisp.vim<cr>
nnoremap <silent> <leader>svv :so $Vim/\vim73/\syntax/\vlisp2.vim<cr>
nnoremap <silent> <leader>sd :so $Vim/\vim73/\syntax/\vdcl.vim<cr>
nnoremap <silent> <leader>sh :so $Vim/\vim73/\syntax/\heidenhain.vim<cr>
nnoremap <silent> <leader>sn :so $Vim/\vim73/\syntax/\newlisp.vim<cr>
"nnoremap <silent> <F7> :set syntax=vlisp<cr>
"nnoremap <silent> <F8> :set syntax=newlisp<cr>
"nnoremap <silent> <leader>sd :set syntax=vdcl<cr>
"nnoremap <silent> <leader>sh :set syntax=heidenhain<cr>

    " === Change foldmethod to marker or to indent ===
nnoremap <leader>i :set foldmethod=indent<cr>
nnoremap <leader>m :set foldmethod=marker<cr>

    " === Yank word with ",y" and swap it with ",s" or paste it with ",p" ===
nnoremap <leader>y my\"yyiw`y:echo "Word marked!"<cr>
nnoremap <leader>s mp\"pyiw\"_diw\"yP`y\"_diw\"pP`p:delmarks y p<cr>:echo "Words swapped!"<cr>
nnoremap <leader>p diw\"yP:echo "Word replaced!"<cr>

    " === Underline the current line with the used characters ===
nnoremap <silent> <leader>= :t.\|s/./=/g\|:nohls<cr>
nnoremap <silent> <leader>- :t.\|s/./-/g\|:nohls<cr>
nnoremap <silent> <leader>+ :t.\|s/./+/g\|:nohls<cr>
nnoremap <silent> <leader>_ :t.\|s/./_/g\|:nohls<cr>

    " === Move entire line up or down with ",k" and ",j"===
nnoremap <leader>j ddp
nnoremap <leader>k ddkP
" }}}

    " XXX === "Other key combinations" === {{{

    " === Map H and L to move to the last or first character ===
"nnoremap H 0
"nnoremap L $

    " H moves you to the first(non)blank character (alternating between)
nnoremap H :call LineHome()<CR>:echo<CR>
    " L moves you to the last(non)blank character (alternating between)
nnoremap L :call LineEnd()<CR>:echo<CR>

" LineHome and LineEnd functions {{{
function! LineHome()
  let x = col('.')
  execute "normal ^"
  if x == col('.')
    execute "normal 0"
  endif
  return ""
endfunction

function! LineEnd()
  let x = col('.')
  execute "normal g_"
  if x == col('.')
    execute "normal $"
  endif
  return ""
endfunction
" }}}

    " === Swap two words ===
"nmap <silent> gw :s:\(\%#\w\+\)\(\_W\+\)\(\w\+\):\3\2\1:<CR>`'
nnoremap <silent> gw dwelp
nnoremap <silent> gW dWElp
nnoremap <silent> gb debP
nnoremap <silent> gB dEBP

    " === Alright... let's try this out ===
"inoremap jj <esc>
"cnoremap jj <esc>
inoremap jk <esc>
cnoremap jk <esc>

    " === Set Keypad + and - to increment and decrement a value ===
"nnoremap <kPlus> <C-a>
"nnoremap <kMinus> <C-x>

    " === Space to toggle folds ===
nnoremap <space> za
vnoremap <space> za

    " === Set middle mouse button as space ===
nnoremap <MiddleMouse> <space>
nnoremap <2-MiddleMouse> <space>
nnoremap <3-MiddleMouse> <space>
nnoremap <4-MiddleMouse> <space>
vnoremap <MiddleMouse> <space>
vnoremap <2-MiddleMouse> <space>
vnoremap <3-MiddleMouse> <space>
vnoremap <4-MiddleMouse> <space>

    " === Map the ; as : for entering a command ===
nnoremap ; :

    " === Yank up to the end of line ===
nnoremap Y y$

    " === Remap j and k to move on the next line of window without jumping wrapped text ===
nnoremap j gj
nnoremap k gk

    " === Map F2 for toggling NERDTree and F3 for bookmark loading ===
map <F2> <esc>:NERDTreeToggle<cr>
map <F3> <esc>:NERDTree 
    " === Map F4 to open _vimrc and F5 to reload _vimrc ===
map <F4> <esc>:vsplit $myvimrc<cr>
map <F5> <esc>:source $myvimrc<cr>:nohls<cr>
    " === Map F10 to return the syntax highlighting group of the item under the cursor
map <F10> <esc>:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"nnoremap <silent> <leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}

    " XXX === "Movement mappings" === {{{
" as as (das fa) sad ad { saddasd} sadads 
    "Inside "(" parantheses
:onoremap p i(

    "Inside "{" curly parantheses
:onoremap ic i{

    "Inside next "(" parantheses
:onoremap inp :<C-u>normal! f(vi(<cr>

    "Inside last "(" parantheses
:onoremap ilp :<C-u>normal! F)vi(<cr>

    "Inside next "{" curly parantheses
:onoremap inc :<C-u>normal! f(vi(<cr>

    "Inside last "{" curly parantheses
:onoremap ilc :<C-u>normal! F}vi{<cr>

" }}}

    " XXX === "Disabled keys" === {{{

    " === To help yourself learning efficient editing methods
    " in insert, normal and visual mode
    " unbind the "cursor keys" along with "Backspace" and "Delete" ===
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>', '<bs>', '<delete>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor
" }}}
" }}}

" Shortcuts For Tabs:
" {{{
" ===============================================

" Functions to move current window to another tab
" {{{
function! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabe %"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    exe "10tabe %"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc
" }}}

nnoremap <M-C-Right> :call MoveToNextTab()<CR><C-w>H
nnoremap <M-C-Left> :call MoveToPrevTab()<CR><C-w>H
nnoremap <M-.> gt
nnoremap <M-,> gT

" ===============================================
" }}}

" Code And Decode: 
" {{{
"nnoremap ,c :s:\\(.\\):\\1ø:g<cr>$x:s:[^ø]:\\=char2nr(submatch(0)):g<cr>:s:\\d\\+:\\=submatch(0) + 9:g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 12 . "ø" . (submatch(2) + 23) . "ø" . (submatch(3) + 26) . "ø" . (submatch(4) + 7):g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 10 . "ø" . (submatch(2) - 13) . "ø" . (submatch(3) - 14):g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 1 . "ø" . (submatch(2) - 1):g<cr>:s:ø: :g<cr>:s:\\d\\+:\\=nr2char(submatch(0)):g<cr>:s:\\s::g<cr>:nohls<cr>
"nnoremap ,d :s:\\(.\\):\\1ø:g<cr>$x:s:[^ø]:\\=char2nr(submatch(0)):g<cr>:s:\\d\\+:\\=submatch(0) - 9:g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 12 . "ø" . (submatch(2) - 23) . "ø" . (submatch(3) - 26) . "ø" . (submatch(4) - 7):g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 10 . "ø" . (submatch(2) + 13) . "ø" . (submatch(3) + 14):g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 1 . "ø" . (submatch(2) + 1):g<cr>:s:\\d\\+:\\=nr2char(submatch(0)):g<cr>:s:ø::g<cr>:nohls<cr>
command! -range Code <line1>,<line2>s:\\(.\\):\\1ø:g | <line1>,<line2>s:[^ø]:\\=char2nr(submatch(0)):g | <line1>,<line2>s:\\d\\+:\\=submatch(0) + 9:g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 12 . "ø" . (submatch(2) + 23) . "ø" . (submatch(3) + 26) . "ø" . (submatch(4) + 7):g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 10 . "ø" . (submatch(2) - 13) . "ø" . (submatch(3) - 14):g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 1 . "ø" . (submatch(2) - 1):g | <line1>,<line2>s:ø: :g | <line1>,<line2>s:\\d\\+:\\=nr2char(submatch(0)):g | <line1>,<line2>s:\\s::g | nohls  
command! -range Decode <line1>,<line2>s:\\(.\\):\\1ø:g | <line1>,<line2>s:[^ø]:\\=char2nr(submatch(0)):g | <line1>,<line2>s:\\d\\+:\\=submatch(0) - 9:g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 12 . "ø" . (submatch(2) - 23) . "ø" . (submatch(3) - 26) . "ø" . (submatch(4) - 7):g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 10 . "ø" . (submatch(2) + 13) . "ø" . (submatch(3) + 14):g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 1 . "ø" . (submatch(2) + 1):g | <line1>,<line2>s:\\d\\+:\\=nr2char(submatch(0)):g | <line1>,<line2>s:ø::g | nohls  
"command! -range Code s:\\(.\\):\\1ø:g | s:[^ø]:\\=char2nr(submatch(0)):g | s:\\d\\+:\\=submatch(0) + 9:g | s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 12 . "ø" . (submatch(2) + 23) . "ø" . (submatch(3) + 26) . "ø" . (submatch(4) + 7):g | s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 10 . "ø" . (submatch(2) - 13) . "ø" . (submatch(3) - 14):g | s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 1 . "ø" . (submatch(2) - 1):g | s:ø: :g | s:\\d\\+:\\=nr2char(submatch(0)):g | s:\\s::g | nohls  
"command! -range Decode s:\\(.\\):\\1ø:g | s:[^ø]:\\=char2nr(submatch(0)):g | s:\\d\\+:\\=submatch(0) - 9:g | s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 12 . "ø" . (submatch(2) - 23) . "ø" . (submatch(3) - 26) . "ø" . (submatch(4) - 7):g | s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 10 . "ø" . (submatch(2) + 13) . "ø" . (submatch(3) + 14):g | s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 1 . "ø" . (submatch(2) + 1):g | s:\\d\\+:\\=nr2char(submatch(0)):g | s:ø::g | nohls  
" }}}

" Paste From Registers:
" {{{
" Paste yanked stuff from 1,2,...,0 and asdfgzxcvb
"nmap <M-1> \"1p
"nmap <M-2> \"2p
"nmap <M-3> \"3p
"nmap <M-4> \"4p
"nmap <M-5> \"5p
"nmap <M-6> \"6p
"nmap <M-7> \"7p
"nmap <M-8> \"8p
"nmap <M-9> \"9p
"nmap <M-0> \"0p
nmap <M-a> \"ap
nmap <M-A> \"aP
nmap <M-s> \"sp
nmap <M-S> \"sP
nmap <M-d> \"dp
nmap <M-D> \"dP
nmap <M-f> \"fp
nmap <M-F> \"fP
nmap <M-g> \"gp
nmap <M-G> \"gP
nmap <M-z> \"zp
nmap <M-Z> \"zP
nmap <M-x> \"xp
nmap <M-X> \"xP
nmap <M-c> \"cp
nmap <M-C> \"cP
nmap <M-v> \"vp
nmap <M-V> \"vP
nmap <M-b> \"bp
nmap <M-B> \"bP
" }}}

" Vimscripting:
" {{{
"echo ">^.^<"
"set nu!
"set numberwidth=4
"set rnu! numberwidth=2
iabbrev lenght length
iabbrev Lenght Length
iabbrev LENGHT LENGTH
iabbrev widht width
iabbrev Widht Width
iabbrev WIDHT WIDTH

iabbrev heigth height
iabbrev Heigth Height
iabbrev HEIGTH HEIGHT
iabbrev rigth right
iabbrev Rigth Right
iabbrev RIGTH RIGHT
iabbrev figth fight
iabbrev Figth Fight
iabbrev FIGTH FIGHT
iabbrev eigth eight
iabbrev Eigth Eight
iabbrev EIGTH EIGHT
"iabbrev Kiss Nilos
"iabbrev Robert Ovidiu
" }}}

"" VLisp:
"" {{{
"" (VLisp) Send variable to function call.
""nmap ,f mlyiw?(defun<cr>/\\/<cr>Pa <esc>:nohls<cr>`lzz
"nmap ,f mlMmL`lyiw?(defun<cr>/\\/<cr>Pa <esc>:nohls<cr>`Lzz`l:echo "Function Parameter set!"<cr>
"
"" (VLisp) Make variable local to function.
""nmap ,l mlyiw?(defun<cr>/\\/<cr>a <esc>p:nohls<cr>`lzz
"nmap ,l mlMmL`lyiw?(defun<cr>/\\/<cr>a <esc>p:nohls<cr>`Lzz`l:echo "Local Variable set!"<cr>
"
"" (VLisp) Nullify global variable
""nmap ,g mlyiw/(defun nullify<cr>/(setq<cr>jo<C-R>" nil<esc>:nohls<cr>`lzz
"nmap ,g mlMmL`lyiw/(defun nullify<cr>/(setq<cr>o<C-R>" nil<esc>:nohls<cr>`Lzz`l:echo "Global Variable nullified!"<cr>
"" }}}

"" NewLISP:
"" {{{
"" Execute current newLisp file - command: Run {{{
"function! NewlispRun()
"    !newlisp "%"
"endfunction
"command! -complete=function Run :call NewlispRun()
"nnoremap <F9> :Run<cr>
"" }}}
"
"" Link to newLisp standalone executable - command: Link {{{
"function! NewlispLink()
"    let orgExe = system("which newlisp")
"    if strpart(orgExe, 0, 6) == "which:"
"	let result = confirm("ERROR: newLisp binary not found in your PATH!", "", "", "Error")
"    else
"	let orgExe = substitute(orgExe, '\n\|\r', "", "g")
"	if has("win32") || has("win64")
"	    let newExeName = fnamemodify(bufname(""), ":r") . ".exe"
"	    let orgExe = substitute(orgExe, '/', "\\", "g")
"	    let result = system('copy "' . orgExe . '" "' . newExeName . '"')
"	    let orgExe = substitute(orgExe, '\\', "/", "g")
"	    let prog = '(silent (setq f \"' . orgExe . '\")'
"	    let prog = prog . '(replace \"/\" f \"\\\\\")'
"	    let prog = prog . '(setq size (first (file-info f)))'
"	    let prog = prog . '(setq buff (pack \"ld\" size))'
"	    let prog = prog . '(setq handle (open \"' . newExeName . '\" \"u\"))'
"	    let prog = prog . '(search handle \"@@@@@@@@\")'
"	    let prog = prog . '(write-buffer handle buff 4)'
"	    let prog = prog . '(setq buff (read-file \"' . bufname("") . '\"))'
"	    let prog = prog . '(setq keylen (pack \"ld\" (length buff)))'
"	    let prog = prog . '(write-buffer handle keylen 4)'
"	    let prog = prog . '(seek handle size)'
"	    let prog = prog . '(setq buff (encrypt buff (string (length buff))))'
"	    let prog = prog . '(write-buffer handle buff (length buff))'
"	    let prog = prog . '(close handle))'
"	    let result = system('newlisp -e "' . prog . '"')
"	else
"	    let newExeName = fnamemodify(bufname(""), ":r")
"	    let result = system('cp "' . orgExe . '" "' . newExeName . '"')
"	    let prog = '(silent (setq size (first (file-info "' . orgExe . '")))'
"	    let prog = prog . '(setq buff (pack "ld" size))'
"	    let prog = prog . '(setq handle (open "' . newExeName . '" "u"))'
"	    let prog = prog . '(search handle "@@@@@@@@")'
"	    let prog = prog . '(write-buffer handle buff 4)'
"	    let prog = prog . '(setq buff (read-file "' . bufname("") . '"))'
"	    let prog = prog . '(setq keylen (pack "ld" (length buff)))'
"	    let prog = prog . '(write-buffer handle keylen 4)'
"	    let prog = prog . '(seek handle size)'
"	    let prog = prog . '(setq buff (encrypt buff (string (length buff))))'
"	    let prog = prog . '(write-buffer handle buff (length buff))'
"	    let prog = prog . '(close handle))'
"	    let result = system("newlisp -e '" . prog . "'")
"	endif
"	if result == ""
"	    let result = confirm("Linking ready!\n\nFile created: \"" . newExeName . '"', "", "", "Info")
"	else
"	    let result = confirm("ERROR: Linking did not succeed!", "", "", "Error")
"	endif
"    endif
"endfunction
"command! -complete=function Link :call NewlispLink()
"" }}}
"
"" Force newLisp syntax - command: Syntax {{{
"function! NewlispSyntax()
"    set syntax=newlisp
"endfunction
"command! -complete=function Syntax :call NewlispSyntax()
"" }}}
"
"" Help for a newLisp command - idea by Cormullion {{{
"function! NewlispHelp(func)
"    if has("unix")
"        let str = substitute(a:func, '?', "p", "")
"	let prog = '(silent (setq file (open {/usr/doc/newlisp/newlisp_manual.html} {read}))'
"	let prog = prog . '(if (not file) (setq file (open {/usr/share/doc/newlisp/newlisp_manual.html} {read})))'
"	let prog = prog . '(setq pos (search file (append {<a name="} "' . str . '" {">} ) ))'
"        let prog = prog . '(read-line file)'
"	let prog = prog . '(read-line file)'
"        let prog = prog . '(read-buffer file buff 1000 {<a name})'
"	let prog = prog . '(replace {<.+>} buff {} 512)'
"        let prog = prog . '(replace {&gt;} buff {>})'
"	let prog = prog . '(replace {&lt;} buff {<})'
"	let prog = prog . '(replace {&mdash;} buff {})'
"	let prog = prog . '(replace {&rarr;} buff {->})'
"        let prog = prog . '(replace "\t" buff {})'
"	let prog = prog . '(replace {example:} buff "example:\n")'
"	let prog = prog . '(replace {<a name} buff {})'
"        let prog = prog . '(if (< (length buff) 5)'
"	let prog = prog . '(println {Primitive not found!})'
"        let prog = prog . '(print buff {...}))'
"	let prog = prog . '(close file))'
"        let result = system("newlisp -e '" . prog . "'")
"    endif
"    return result
"endfunction
"" }}}
"
"" Print on console - command: Help {{{
"function! WrapNewlispHelp(func)
"    let result = NewlispHelp(a:func)
"    echo result
"endfunction
"
"" Define command for help
"command! -complete=function -nargs=1 Help :call WrapNewlispHelp(<f-args>)
"" }}}
"
"" For GUI newlisp help {{{
"function! GuiNewlispHelp()
"    let txt = inputdialog("Enter the command to lookup:", "")
"    if txt != ""
"	let result = NewlispHelp(txt)
"	let choice = confirm(result)
"    endif
"endfunction
"" }}}
"
"" Setup menus {{{
"amenu 80.10 &newLisp.&Run\ current\ program :call NewlispRun()<CR>
"amenu 80.20 &newLisp.&Link\ to\ executable :call NewlispLink()<CR>
"amenu 80.30 &newLisp.-Sep1- :
"amenu 80.40 &newLisp.&Help\ on\ command :call GuiNewlispHelp()<CR>
"amenu 80.50 &newLisp.-Sep2- :
"amenu 80.60 &newLisp.&Set\ syntax\ to\ newLisp :call NewlispSyntax()<CR>
"
"" Setup Toolbar
"amenu ToolBar.-Sep- :
"tmenu ToolBar.Exe Run current newLISP file
"amenu ToolBar.Exe :call NewlispRun()<CR>
"" }}}
"" }}}

" OTHER:
" {{{
" UNSORTED:
"{{{
" iskeyword=38,42,43,45,47-58,60-62,64-90,97-122,_

"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction
"}}}

" Useful maybe plugins
" Pathogen
" gundo
" YankRing
" Surround
" Repeat
" Ack
" NERDCommenter
" Rainbow Parentheses
" fugitive
