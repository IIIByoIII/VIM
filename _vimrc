" Basic Settings And Functions:
" {{{
set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/defaults.vim
behave mswin
colorscheme byosrcery
let g:airline_theme='base16_seti'
let g:airline#extensions#whitespace#enabled = 0
"colorscheme xoria256
"set guifont=Courier10\ BT:h11
"set guifont=Courier:h10
"set guifont=Consolas_NF:h11:W500:cANSI:qDEFAULT
set guifont=Consolas:h16.5
set encoding=utf-8
setglobal fileencoding=utf-8
"set fileencodings=ucs-bom,utf-8,latin1

    " === Pathogen plugin installer. ===
"call pathogen#infect()
"execute pathogen#infect()

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

    " === Switch on syntax highlighting. ===
syntax on

  "this function removes a character of your choice (I don't really understand it)
  "you can view more about this function by typing :helpgrep Eatchar
  "use after abbreviations by adding this "<c-r>=Eatchar('\s')<cr>" at the end
func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

  "Incrementing and decrementing a number with the specified value
func! Incr(nr)
  let g:mynr = g:mynr + a:nr
  return g:mynr
endfunc

func! Decr(nr)
  let g:mynr = g:mynr - a:nr
  return g:mynr
endfunc

function! GetCount(pattern)
  let l:cnt = 0
  silent exe '%s/' . a:pattern . '/\=execute(''let l:cnt += 1'')/gn'
  return l:cnt
endfunction

" Return list of matches for given pattern in given range.
" This only works for matches within a single line.
" Empty hits are skipped so search for '\d*\ze,' is not stuck in '123,456'.
" If omit match() 'count' argument, pattern '^.' matches every character.
" Using count=1 causes text before the 'start' argument to be considered.
function! GetMatches(line1, line2, pattern)
  let hits = []
  for line in range(a:line1, a:line2)
    let text = getline(line)
    let from = 0
    while 1
      let next = match(text, a:pattern, from, 1)
      if next < 0
        break
      endif
      let from = matchend(text, a:pattern, from, 1)
      if from > next
        call add(hits, strpart(text, next, from - next))
      else
        let char = matchstr(text, '.', next)
        if empty(char)
          break
        endif
        let from = next + strlen(char)
      endif
    endwhile
  endfor
  return hits
endfunction

    " === Used to make block type folds without end marker ===
"function! BlockFolds()
"   let thisline = getline(v:lnum)
"   if match(thisline, '^\/\/\/\/ Block') >= 0
"      return ">1"
"   else
"      return "="
"   endif
"endfunction
"
"setlocal foldmethod=expr
"setlocal foldexpr=BlockFolds()
"
" Creating directories if missing
"if !isdirectory($HOME."/.vim")
"    call mkdir($HOME."/.vim", "", 0770)
"endif
"if !isdirectory($HOME."/.vim/undo-dir")
"    call mkdir($HOME."/.vim/undo-dir", "", 0700)
"endif
" }}}

" Usefull To Know:
" {{{
" see :h commentary
" see Linediff.vim
" :-7t-1 ................... 7th line above copy to line above 
" :3,9t20 .................. lines from 3 to 9 copy to below line 20
" :3,9m20 .................. lines from 3 to 9 move to below line 20
" :16t.  ................... copy line16 1 line below
" :t10   ................... copy current line to line 10
" :46put=@f ................ put content of register f after line 46
" :t$    ................... copy current line to the end of file
" :m$    ................... move current line to the end of file
" :,+t0  ................... move current and next line to line 0
" :/user-friend/m$ ......... move next "user-friend" to the final line
" :g/TITLE/ m+1 ............ moves down lines with TITLE
" :m+ ...................... move current line to line below
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
  au BufRead,BufNewFile *.txt set filetype=txtfiles
  au BufRead,BufNewFile *.txt~ set filetype=txtfiles
  au BufRead,BufNewFile *.r set filetype=rebyol
  au BufRead,BufNewFile *.r~ set filetype=rebyol
  au BufRead,BufNewFile *.r3 set filetype=rebyol3
  au BufRead,BufNewFile *.r3~ set filetype=rebyol3
  au BufRead,BufNewFile *.vimtips set filetype=vimtips
  au BufRead,BufNewFile *.vimtips~ set filetype=vimtips
  au BufRead,BufNewFile *.nc set filetype=gcodehaas
  au BufRead,BufNewFile *.nc~ set filetype=gcodehaas
  au BufRead,BufNewFile *.ahk set filetype=byohotkey
  au BufRead,BufNewFile *.ahk~ set filetype=byohotkey
  au BufRead,BufNewFile *.todo set filetype=todofiles
  au BufRead,BufNewFile *.todo~ set filetype=todofiles
  au BufRead,BufNewFile *.code set filetype=sfm_custom_missions_2
  au BufRead,BufNewFile *.code~ set filetype=sfm_custom_missions_2
  "au BufRead,BufNewFile *.cs set filetype=cbyosharp
  "au BufRead,BufNewFile *.cs~ set filetype=cbyosharp
augroup END
" }}}

" Set:
" {{{
"set verbose=0

    " === Set directory of backup files ===
"set backupdir=~/vimtmp,.
"set directory=~/vimtmp,.
"set undodir=~/vimtmp,.
set backupdir=$HOME\\Backups\\Backups
set backup
"set directory=$HOME\\Backups\\Swaps\\\
"set swapfile
"set undodir=$HOME\\Backups\\Undos\\\
"set undofile

    " === Auto fold code using markers (default {{{}}}) ===
set foldmethod=marker
set foldmarker={{{,}}} "force the default marker
    " to create fold select code visually and press "zf"
"set foldmethod=indent

    " === Tabstops and other cosmetics ===
set tabstop=4
set shiftwidth=2
set softtabstop=0
set smarttab
set expandtab
set autoindent
"set smartindent        "or cindent for c type languages

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
"set novb

    " === Disable some visual flashes see h: belloff ===
"set belloff=all
set belloff=esc,error

    " === Allow backspacing over indent, eol, and the start of an insert ===
set backspace=2

    " === Make sure that unsaved buffers that are to be put in the background are
    " allowed to go in there (ie. the "must save first" error doesn't come up) ===
set hidden

    " === Make the 'cw' and like commands put a $ at the end instead of just
    " deleting the text and replacing it ===
set cpoptions=ces$

    " === tell VIM to always put a status line in, even if there is only one window ===
set laststatus=2

    " === Don't update the display while executing macros ===
set lazyredraw

    " === Show the current mode ===
set showmode

    " === Hide the mouse pointer while typing ===
set mousehide

    " === Set up the gui cursor to look nice ===
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

    " === set the gui options the way I like ===
set guioptions=acgml
"set guioptions=acg

    " This is the timeout used while waiting for user input on a multi-keyed
    " macro or while just sitting and waiting for another key to be pressed
    " measured in milliseconds.
    "
    " i.e. for the ",d" command, there is a "timeoutlen" wait period between
    "      the "," key and the "d" key.  If the "d" key isn't pressed before
    "      the timeout expires, one of two things happens: The "," command is
    "      executed if there is one (which there isn't) or the command aborts.
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

    " === Set the textwidth (usual is 80 chars) ===
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
"set number!
"set relativenumber!

    " === Toggle relative and current line number with reload ===
if &nu == 1
  if &rnu == 1
    set norelativenumber
  else
    set nonumber
  endif
else
  set relativenumber
  set number
endif

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
    " XXX === "Quick comment out lines" === {{{
"let s:comment_map = { 
"    \   "python": '#',
"    \   "autohotkey": ';',
"    \   "vim": '"',
"    \ }
"
"function! ToggleComment()
"    if has_key(s:comment_map, &filetype)
"        let comment_leader = s:comment_map[&filetype]
"        if getline('.') =~ "^\\s*" . comment_leader . " " 
"            " Uncomment the line
"            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
"        else 
"            if getline('.') =~ "^\\s*" . comment_leader
"                " Uncomment the line
"                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
"            else
"                " Comment the line
"                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
"            end
"        end
"    else
"        echo "No comment leader found for filetype"
"    end
"endfunction
"
"
"nnoremap <leader>c :call ToggleComment()<cr>
"vnoremap <leader>c :call ToggleComment()<cr>
" }}}

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

    " === Jump back and forth to brackets ===
nnoremap <M-u> ?(<cr>:nohls<cr>
nnoremap <M-i> /(<cr>:nohls<cr>
nnoremap <M-o> ?)<cr>:nohls<cr>
nnoremap <M-p> /)<cr>:nohls<cr>
"nnoremap <M-h> ?(<cr>:nohls<cr>
"nnoremap <M-l> /(<cr>:nohls<cr>
nnoremap <M-m> %

    " === Jump to next and previous difference (change) ===
nnoremap <M-z> ]c
nnoremap <M-q> [c

    " === Add or substract value from number under cursor ===
nnoremap <M-a> wb<bs>/-\\=\\d<cr>:nohls<cr>cw<C-r>=<C-r>"+
nnoremap <M-x> wb<bs>/-\\=\\d<cr>:nohls<cr>cw<C-r>=<C-r>"-

    " === Jump next or previous start or end of line ===
"nnoremap <M-i> gj$
"nnoremap <M-o> gk$
"nnoremap <M-j> gj^
"nnoremap <M-k> gk^

    " === Move to the bottom top or middle of window ===
"nnoremap <M-j> L
"nnoremap <M-k> H
"nnoremap <M-m> M
nnoremap <M-h> H
nnoremap <M-l> L

    " === Use Alt+j,k to scroll down and up fast (normal default mapping) ===
nnoremap <M-j> <C-D>
nnoremap <M-k> <C-U>
vnoremap <M-j> <C-D>
vnoremap <M-k> <C-U>

    " === Set the next and previous buffer to keys ===
nnoremap <M-]> :bn<cr>
nnoremap <M-[> :bp<cr>

    " === Set wrap toggle to button ===
nnoremap <silent> <M-w> :set wrap!<cr>

    " === Do not highlight search ===
nnoremap <M-\> :nohls<cr>

    " === Insert date and time below current line ===
nnoremap <M-t> o(<c-r>=strftime("%c")<cr>)<esc>0

    " === Use ALT-E and ALT-R to replace the original ';' and ',' mapping (repeat last f, t, F or T) ===
nnoremap <M-e> ;
"nnoremap <M-r> ,

    " === Insert [stuck] at the end ===
nnoremap <M-s> ma0:call DeleteStatusBracket()<cr>a [stuck]<esc>`a
    " === Insert [done %y-%m-%d] at the end ===
nnoremap <M-d> ma0:call DeleteStatusBracket()<cr>a [done <c-r>=strftime("%y-%m-%d")<cr>]<esc>`a
    " === Insert [doing] at the end ===
nnoremap <M-f> ma0:call DeleteStatusBracket()<cr>a [doing]<esc>`a
    " === Insert [maybe?] at the end ===
nnoremap <M-g> ma0:call DeleteStatusBracket()<cr>a [maybe?]<esc>`a
    " === Delete bracket at the end ===
nnoremap <M-c> ma0:call DeleteStatusBracket()<cr>`a

"function! DeleteBracket() " {{{
"  let x = col('.')
"  execute "normal f]"
"  let y = col('.')
"  if x != y
"    execute "normal F["
"    if y == col('.')
"      execute "normal $"
"    else
"      execute "normal D"
"    endif
"  else
"    execute "normal $"
"  endif
"  s/\s\+$//e
"  execute "normal $"
"  nohls
"endfunction
" }}}
function! DeleteStatusBracket() " {{{
  s/\[stuck\]//e
  s/\[done.\+\]//e
  s/\[doing\]//e
  s/\[maybe?\]//e
  s/\s\+$//e
  execute "normal $"
  nohls
endfunction
" }}}

    " === Open Renishaw.nc ===
"nnoremap <M-r> <esc>:vsplit D:\\DropBox\\Expertmoder IR Dropbox\\Expertmoder IR\\Comenzi_Clienti\\Programe CNC\\02_Altele\\Cicluri masurare cu renishaw\\Renishaw.nc<cr>

    " === Close previous bracket automaticaly on its column on the line below cursor ===
"nnoremap <M-n> A)<esc>%:let crtcol = col(".")<cr>%xo<esc>:let crtlin = line(".")<cr>:call cursor(crtlin, crtcol)<cr>i)<esc>
"inoremap <M-n> <esc>A)<esc>%:let crtcol = col(".")<cr>%xo<esc>:let crtlin = line(".")<cr>:call cursor(crtlin, crtcol)<cr>i)

    " === Insert fold start and fold end
inoremap <M-[> ; {{{
inoremap <M-]> ; }}}
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

    " === Set <C-l> as delete in normal, insert and command mode ===
"inoremap <C-l> <C-o>x
nnoremap <C-l> x
inoremap <C-l> <del>
cnoremap <C-l> <del>

    " === Insert new blank line above and below the cursor ===
nnoremap <C-j> o<esc>
nnoremap <C-k> O<esc>

    " === Change case of word using Ctrl+c ===
"nnoremap <C-c> mlviw~`l
"inoremap <C-c> <esc>mlviw~`la
"vnoremap <C-c> <esc>mlviw~`lv

    " === Insert new line above (similar to Ctrl+j) ===
inoremap <C-k> <esc>O

    " === Use Ctrl+d instead of Ctrl+k to enter digraph ===
inoremap <C-d> <C-k>

    " === Use Ctrl+v to paste register in insert or command mode ===
"inoremap <C-v> <C-r>
"cnoremap <C-v> <C-r>  "this is not working somehow

    " === Use Ctrl+TAB to change between windows ===
nnoremap <C-Tab> <C-W>w

    " === Use Ctrl+S to save the file ===
nnoremap <C-s> :update<CR>

    " === Use Ctrl+w then d to close window and delete buffer ===
nnoremap <C-w>d :bd<CR>
" }}}

    " XXX === "Leader key combitations" === {{{

    " === Load Heidenhain and VLisp syntaxes ===
"nnoremap <silent> <leader>sv :so $Vim/\vim73/\syntax/\vlisp.vim<cr>
"nnoremap <silent> <leader>svv :so $Vim/\vim73/\syntax/\vlisp2.vim<cr>
"nnoremap <silent> <leader>sd :so $Vim/\vim73/\syntax/\vdcl.vim<cr>
"nnoremap <silent> <leader>sh :so $Vim/\vim73/\syntax/\heidenhain.vim<cr>
"nnoremap <silent> <leader>sn :so $Vim/\vim73/\syntax/\newlisp.vim<cr>
"nnoremap <silent> <F7> :set syntax=vlisp<cr>
"nnoremap <silent> <F8> :set syntax=newlisp<cr>
"nnoremap <silent> <leader>sd :set syntax=vdcl<cr>
"nnoremap <silent> <leader>sh :set syntax=heidenhain<cr>

    " === Change foldmethod to marker or to indent ===
nnoremap <leader>zi :set foldmethod=indent<cr>
nnoremap <leader>zm :set foldmethod=marker<cr>

    " === Close all folds but the one the cursor is (open up to 8 levels)
nnoremap <leader>zz zMzozozozozozozozo

    " === Use scroll bind or disable it ===
nnoremap <leader>sb :set scrollbind<cr><C-w>w:set scrollbind<cr><C-w>W
nnoremap <leader>nsb :set noscrollbind<cr><C-w>w:set noscrollbind<cr><C-w>W

    " === Yank word and swap it or paste it ===
nnoremap <leader>y my\"yyiw`y:echo "Word marked!"<cr>
nnoremap <leader>u mp\"pyiw\"_diw\"yP`y\"_diw\"pP`p:delmarks y p<cr>:echo "Words swapped!"<cr>
nnoremap <leader>p diw\"yP:echo "Word replaced!"<cr>

    " === Underline the current line with the used characters ===
nnoremap <silent> <leader>= :t.\|s/./=/g\|:nohls<cr>
nnoremap <silent> <leader>- :t.\|s/./-/g\|:nohls<cr>
nnoremap <silent> <leader>+ :t.\|s/./+/g\|:nohls<cr>
nnoremap <silent> <leader>_ :t.\|s/./_/g\|:nohls<cr>

    " === Move entire line up or down with ",k" and ",j"===
nnoremap <leader>j ddp
nnoremap <leader>k ddkP

    " === Change decimal (float) after current or last alphabetic char === 
"nnoremap <leader>n ?\\a<cr>/\\d\\+\\.\\=\\d*<cr>:nohls<cr>gnc
"nnoremap <leader>n :let @l=@/<cr>?\\a<cr>/\\d\\+\\.\\=\\d*<cr>:nohls<cr>gnc

    " === Change to end of word excluding first character ===
"nnoremap <leader>n lblcw

    " === Surround visual selection with custom character(s) ===
vnoremap <leader>s <esc>:call QuickWrap('')<left><left>
" surround Surround
function! QuickWrap(wrapper)
  if len(a:wrapper) > 1
    let l:ws = a:wrapper[0]
    let l:we = a:wrapper[-1:]
  else
    let l:ws = a:wrapper
    let l:we = a:wrapper
  endif
  let l:inside_or_around = (&selection == 'exclusive') ? ('i') : ('a')
  normal `>
  execute "normal " . inside_or_around . escape(we, '\')
  normal `<
  execute "normal i" . escape(ws, '\')
  normal `<
endfunction

    " === Remove first and last character of selection ===
vnoremap <leader>S <esc>:call StripWrap()<cr>

function! StripWrap()
  normal `>X`<x
endfunction

    " === Split window vertically and change first (left) one to next buffer ===
nnoremap <leader>vv <C-w>v:bn<cr>

    " === Shortcuts for diffthis and diffoff commands for two open codes ===
"nnoremap <leader>dt :diffthis<cr>
nnoremap <leader>dt :diffthis<cr><C-w>w:diffthis<cr><C-w>w
"nnoremap <leader>do :diffoff<cr>
nnoremap <leader>do :diffoff<cr><C-w>w:diffoff<cr><C-w>w

    " === Shortcuts for Linediff and LinediffReset (see Linediff.vim plugin) ===
vnoremap <leader>ldt :Linediff<cr><C-w>w
nnoremap <leader>ldr :LinediffReset<cr>

    " === Remove and change some code generated for HAAS lathe === 
" Example Techniques:
"nnoremap <leader>fw :let @q='exhx'<cr>
"                   \:g/^T\\d\\+/normal @q<cr>
"                   \gg/\\sT\\d<cr>0:nohls<cr>:let @c=601<cr>
"
":g/G00 A/ normal! kOM11<cr>
"nnoremap <leader>tt :g/G255/execute "normal! ?(\<cr>OM11"<cr>

"nnoremap <leader>fe gg/^G00 G53 X#191 Y0. Z#192<cr>dd
"                   \/^G00 G53 X#191 Y0. T0<cr>
"                   \2ddyypkwDiG200 U#1 W#2 X<esc>ma
"                   \/X\\d<cr>lyw`apa Z<esc>ma
"                   \/Z\\d<cr>lyw`ap$a (on the fly tool change)<esc>
"                   \O#1 = ABS[#5021] + #191 - 0.01 (incremental X)<cr>
"                   \#2 = ABS[#5022] + #192 - 0.01 (incremental Z)<esc>
"                   \jIIF [#3026 NE <esc>wlyt bPa<bs><bs>] THEN <esc>l
"                   \:nohls<cr>

    " === Remove and change some code generated for HAAS lathe === 
"position cursor and reset counter
nnoremap <leader>gq gg/\\sT\\d<cr>0:nohls<cr>:let @c=601<cr>
"repeat for every tool
nnoremap <leader>gw ma0wl"syt hdw0i#<esc>"cpa = <esc>
                  \:let @t=<c-r>s<cr>:let @t=@t*100+@t<cr>"tpa <esc>
                  \:%s:T<c-r>t\\s:T#<c-r>c :g<cr>
                  \:let @c=@c+1<cr>`aj0
"repeat for every operation
nnoremap <leader>ge gg/^G00 G53 X#191 Y0. Z#192<cr>dd
                  \/^G00 G53 X#191 Y0. T0<cr>
                  \2ddyypkwDiG200 U#1 W#2 X<esc>ma
                  \/ X\\d<cr>llyw`apa Z<esc>ma
                  \/ Z\\d<cr>llyw`ap$a (on the fly tool change)<esc>
                  \O#1 = ABS[#5021] + #191 - 0.01 (incremental X)<cr>
                  \#2 = ABS[#5022] + #192 - 0.01 (incremental Z)<esc>
                  \jIIF [#3026 NE FIX[<esc>wlyt bPa / 100.0]] THEN <esc>l
                  \:s:\\s\\s\\+: :ge<cr>
                  \:nohls<cr>
"search for next tool
nnoremap <leader>gr /^N<cr>:nohls<cr>
"insert efficient tool change
nnoremap <leader>gt ma?T#\\=\\d\\+\\s(<cr>yy`apoM08<esc>kk?Z-\\=\\d<cr>yw`ajoG00 <esc>
                  \pkk?X-\\=\\d<cr>yw`ajjoG00 <esc>
                  \pkkk?F\\d<cr>"syw`a/G01<cr>
                  \:if search('\\sF\\d','cn',line('.')) \| echo "F exists" \| else \| normal $l"spendif<cr>
                  \`aoIF [#3026 NE FIX[<esc>j0lyt k$pA / 100.0]] THEN G00 G53 X#191 Y0. Z#192 T0<esc>
                  \`ak0iM01<esc>`a
                  \:nohls<cr>:echo "All done"<cr>

    " === Insert current date and time in milling programs ===
"nnoremap <leader>x gg/^G<cr>kldt)i<c-r>=strftime("%c")<cr><esc>0:nohls<cr>

    " === Remove and change some code generated for HAAS mill (3 Axis) === 
    " tidy up, position cursor and reset counter
nnoremap <leader>fg zR
                   \:g/^M10/d<cr>
                   \:g/^M12/d<cr>
                   \:g/G126/d<cr>
                   \:g/G00 C0 A0/d<cr>
                   \:g/G0 C0 A0/d<cr>
                   \:g/G254/d<cr>
                   \:g/G255/d<cr>
                   \:g/^(GO TO TOOL CHANGE POSITION)/d<cr>
                   \:%s:G00 G53 X.\\+::ge<cr>
                   \:%s:\\sC0\\sA0::g<cr>
                   \:%s:M30:G00 G53 X-500. Y0\\rM30:g<cr>
                   \:%s:G81.\\+:& E2000:ge<cr>
                   \:%s:G83.\\+:& E2000:ge<cr>
                   \:%s:G84.\\+:& E2000:ge<cr>
                   \G?^T<cr>kk3ddgg<cr>
                   \gg/^.T\\d<cr>zM:nohls<cr>:let @c=601<cr>

    " === Remove and change some code generated for HAAS mill (4 Axis) === 
    " tidy up, position cursor and reset counter
nnoremap <leader>fh zR
                   \:g/^M10/d<cr>
                   \:g/^M12/d<cr>
                   \:g/G126/d<cr>
                   \:%s:\\sC0::g<cr>
                   \:%s:G254.\\+:M10:g<cr>
                   \:g/G255/d<cr>
                   \:g/^(GO TO TOOL CHANGE POSITION)/d<cr>
                   \:%s:G00 G53 X.\\+::ge<cr>
                   \:%s:M30:G00 G53 X-240. Y0 A0\\rM30:g<cr>
                   \:%s:G81.\\+:& E2000:ge<cr>
                   \:%s:G83.\\+:& E2000:ge<cr>
                   \:%s:G84.\\+:& E2000:ge<cr>
                   \G?^T<cr>kk3ddgg/G17<cr>
                   \gg/^.T\\d<cr>zM:nohls<cr>:let @c=601<cr>

    " === Use parametric tool number in code (for first tool) === 
nnoremap <leader>fb ma0ll"syt-hdw0i#<esc>"cpa = <esc>"spa <esc>
                  \:%s:T<c-r>s$:T#<c-r>c:ge<cr>
                  \:%s:T<c-r>s\\s\\(.\\+$\\):T#<c-r>c \\1\\r
                  \IF [#[2000+#<c-r>c] LT 30.0] GOTO 9999 (Verificare lungime):g<cr>
                  \:%s: H0\\=<c-r>s : H#<c-r>c :g<cr>
                  \:%s: D0\\=<c-r>s$: D#<c-r>c:ge<cr>
                  \:let @c=@c+1<cr>`aj0
                  \:call setreg('q', ',fb', 'c')<cr>
                  " If you change the key, modify here too

    " === Use parametric tool number in code (only if you have one tool) === 
nnoremap <leader>fv ma0ll"syt-hdw0i#<esc>"cpa = <esc>"spa <esc>
                  \:%s:T<c-r>s\\s\\(.\\+$\\):T#<c-r>c \\1\\r
                  \IF [#[2000+#<c-r>c] LT 30.0] GOTO 9999 (Verificare lungime):g<cr>
                  \:%s: H0\\=<c-r>s : H#<c-r>c :g<cr>
                  \:%s: D0\\=<c-r>s$: D#<c-r>c:ge<cr>
                  \ma:let g:mynr=0<cr>
                  \gg/^T<cr>
                  \:.,$s:^(\\w\\+.\\+$:\\="N" . Incr(10) . " " . submatch(0):g<cr>
                  \gg/^G17<cr>O<esc>j
                  \:let @c=g:mynr/10<cr>
                  \:call setreg('q', 'mazr:let @c=g:mynr/10' . nr2char(13) .
                  \'gg@c/^N\\d\\+' . nr2char(13) .
                  \'"syy`a"sPwxi- ' . nr2char(27) .
                  \'I(' . nr2char(27) .
                  \'0:call Decr(10)' . nr2char(13) , 'c')<cr>
                  \@c@q
                  \GO<cr>N9999 (Lungime scula prea mica)<cr>
                  \#3000 = 1 (Verifica-ti lungimea sculei!)<cr>
                  \(Vezi daca lungimea sculei este ce trebuie)<cr>
                  \(Daca da, poti modifica valoarea minima in program)<cr>
                  \(Valoarea este dupa LT, imediat dupa chemarea sculei)<cr>
                  \M30<esc>gg/^#6<cr>:nohls<cr>O<esc>

    " === Number the rest of the tools and every operation in code ===
nnoremap <leader>fn ma:let @n=GetCount("^(T\\\\d")<cr>`a@n@q:nohls<cr>
                  \:let @i=@c-601<cr>
                  \ma:let g:mynr=0<cr>
                  \gg/^T<cr>
                  \:.,$s:^(\\w\\+.\\+$:\\="N" . Incr(10) . " " . submatch(0):g<cr>
                  \gg/^G17<cr>
                  \:let @c=g:mynr/10<cr>
                  \:call setreg('q', 'mazr:let @c=g:mynr/10' . nr2char(13) .
                  \'gg@c/^N\\d\\+' . nr2char(13) .
                  \'"syy`a"sPwxi- ' . nr2char(27) .
                  \'I(' . nr2char(27) .
                  \'0:call Decr(10)' . nr2char(13) , 'c')<cr>
                  \@c@q
                  \:let @c=@i<cr>
                  \:call setreg('q', 'gg@i/^T#\\d\\+\\sM' . nr2char(13) .
                  \'f("syf)/^N\\d' . nr2char(13) . '*O' . nr2char(13) .
                  \nr2char(27) . '0"sP:let @i=@i-1' . nr2char(13) , 'c')<cr>
                  \@c@q
                  \GO<cr>N9999 (Lungime scula prea mica)<cr>
                  \#3000 = 1 (Verifica-ti lungimea sculei!)<cr>
                  \(Vezi daca lungimea sculei este ce trebuie)<cr>
                  \(Daca da, poti modifica valoarea minima in program)<cr>
                  \(Valoarea este dupa LT, imediat dupa chemarea sculei)<cr>M30<esc>
                  \:%s:\\(M0[34]\\)\\sF\\d\\+\\.\\=\\d\\{}:\\1:g<cr>
                  \gg/^#6<cr>:nohls<cr>O<esc>

    " === Modify G54 to G#110 and A axis moves to contain X and Y moves too from next operation ===
nnoremap <leader>fm magg/^#6<cr>O<cr>
                  \(ATENTIE! Originea se va lua doar in cazul in care se pierde)<cr>
                  \#110 = 110 (Nr. Origine)<cr>
                  \(X-pe suprafata de tampon [ad. 3mm])<cr>
                  \(Y-centru pe axa de rotatie)<cr>
                  \(Z-centru pe axa de rotatie)<cr><esc>
                  \:%s:G54:G#110:ge<cr>
                  \:%s:\\(^G00\\sA-\\{}\\d\\+\\.\\{}\\d\\{}$\\)
                  \\\(\\n^M10.\\{}\\)\\n^G00\\(\\s\[XY].\\+\\):\\1\\3\\2:g<cr>
                  \:%s:G00\\sG53\\sZ0$\\n^G00:G00 Z169.\\rG00:g<cr>
                  \:%s:^G0\\sA0$\\n\\(^G00\\sG53\\sX.\\+Y\\S\\+\\).\\+$:
                  \G91 G28 G00 A0\\rG90\\r\\1:g<cr>
                  \`a:nohls<cr>:echo "Done"<cr>

    " === Insert tool call for HAAS mill === 
nnoremap <leader>ft ma?T#\\=\\d\\+\\sM<cr>3yy`apOM09<cr>G00 G53 Z0.<cr>
                   \G00 G53 X-500. Y0.<cr>M00<cr>()<esc>/G00 Z<cr>
                   \d4liG43 H<esc>?^T<cr>nl"syw/HZ<cr>"spOM08<esc>
                   \?^()<cr>:nohls<cr>:echo "Write the instructions!"<cr>a

    " === Remove redundant feed rates ===
"nnoremap <leader>fk maggzR:%s:\\(M0[34]\\)\\sF\\d\\+\\.\\=:\\1:g<cr>
"                  \:%s:\\(F\\d\\+\\)\\d\\.\\d\\{}:\\10.:g<cr>gg
"                  \:let @m=GetCount("F\\\\d")-1<cr>
"                  \/F\\d<cr>"fyw:let prev_feed=DelLastSpace("<c-r>f")<cr>
"                  \:call setreg('q', ',fla', 'c')<cr>@m@q
"                  \gg/F\\d<cr>:nohls<cr>

nnoremap <leader>fj maggzR`ak/T#\\d\\+\\sM06<cr>ma"syf):let @a=line(".")<cr>
                  \/G53\\sZ0<cr>mb:let @b=line(".")<cr>
                  \:let cnt=0<cr>:let changed=0<cr>
                  \:'a,'bs:\\(F\\d\\+\\)\\d\\.\\d\\{}:\\10.:g<cr>gg
                  \:'a,'bs:F\\d\\+:\\=execute("let cnt += 1"):n<cr>
                  \:let @m=cnt-1<cr>
                  \`a/F\\d<cr>"fyw:let prev_feed=DelLastSpace("<c-r>f")<cr>
                  \:if <c-r>m<cr>
                  \call setreg('q', ',fla', 'c')<cr>
                  \else<cr>
                  \call setreg('q', '', 'c')<cr>
                  \endif<cr>@m@q:let @d=changed<cr>
                  \`b/T#\\d\\+\\sM06<cr>zt:let @m=<c-r>m+1<cr>
                  \:echo "<c-r>s\\nfrom row <c-r>a to <c-r>b, removed <c-r>d out of <c-r>m feeds!"<cr>

                "For true last used feed verification
"nnoremap <leader>fk maggzR:%s:\\(M0[34]\\)\\sF\\d\\+\\.\\=:\\1:g<cr>
"                  \:%s:\\(F\\d\\+\\)\\d\\.\\d\\{}:\\10.:g<cr>gg
"                  \:let @m=GetCount("F\\\\d")-1<cr>
"                  \/F\\d<cr>"fyw:let g:prev_feed=DelLastSpace("<c-r>f")<cr>
"                  \:call setreg('q', ',fla', 'c')<cr>@m@q
"                  \gg/F\\d<cr>:nohls<cr>

    " used above for verifying and replacing all the feeds by counter
    " you don't need to run this manually
nnoremap <leader>fla n"fdw:let new_feed=DelLastSpace("<c-r>f")<cr>
                  \:let the_feed=FeedReplace(prev_feed, new_feed, 20.0)<cr>
                  \:exe "normal! i" . the_feed<cr>
                  \:let prev_feed=new_feed<cr>

                "For true last used feed verification
    " used above for verifying and replacing all the feeds by counter
    " you don't need to run this manually
"nnoremap <leader>fla n"fdw:let g:new_feed=DelLastSpace("<c-r>f")<cr>
"                  \:let the_feed=FeedReplace(prev_feed, new_feed, 20.0)<cr>
"                  \:exe "normal! i" . the_feed<cr>
"                  \:call NewFeed(the_feed)<cr>

" for substrings see :h expr-[:]
function! DelLastSpace(string)
  if (a:string[-1:] =~ '\s')
    return a:string[:-2]
  else
    return a:string
  endif
endfunction

function! FeedReplace(previous, current, tolerance)
  let l:prev_val=a:previous[1:]
  let l:curr_val=a:current[1:]
  if and(l:curr_val >= (l:prev_val - a:tolerance), l:curr_val <= (l:prev_val + a:tolerance))
    let g:changed+=1
    return ""
  else
    return a:current . " "
  endif
endfunction

  "For true last used feed verification
"function! NewFeed(feed)
"  if (a:feed != "")
"    let g:prev_feed=g:new_feed
"  endif
"endfunction

    " === Insert parameters for tool speed and feed "
"TODO: Use GetMatches()
"echo uniq(sort(GetMatches(119,165,"F\\d\\+\\.\\d\\{}")))

    " === Insert tool call for HAAS lathe === 
"nnoremap <leader>fs ma?T#\\=\\d\\+\\s(<cr>yy`apoM08<esc>kk?Z-\\=\\d<cr>yw`ajoG00 <esc>
"                   \pkk?X-\\=\\d<cr>yw`ajjoG00 <esc>
"                   \pkkk?F\\d<cr>"syw`a/G01<cr>
"                   \:if search('\\sF\\d','cn',line('.')) \| echo "F exists" \| else \| normal $l"spendif<cr>
"                   \`aoIF [#3026 NE <esc>j0lyt k$pA<bs><bs>] THEN G00 G53 X#191 Y0. Z#192 T0<esc>
"                   \`ak0iM01<esc>`a
"                   \:nohls<cr>:echo "All done"<cr>

    " === Number every operation in code ===
"nnoremap <leader>h ma:let g:mynr=0<cr>
"                  \gg/^T<cr>
"                  \:.,$s:^(\\w\\+.\\+$:\\="N" . Incr(10) . " " . submatch(0):g<cr>
"                  \gg/^G17<cr>
"                  \:let @c=g:mynr/10<cr>
"                  \:call setreg('q', 'mazr:let @c=g:mynr/10' . nr2char(13) . 'gg@c/^N\\d\\+' . nr2char(13) . '"syy`a"sPwxi- ' . nr2char(27) . 'I(' . nr2char(27) . '0:call Decr(10)' . nr2char(13) , 'c')<cr>
"                  \@c@q:nohls<cr>

"OLD METHODS
"    " === Reset position and counter to 601 for tool number ===
"nnoremap <leader>fb gg/^.T\\d<cr>zM:nohls<cr>:let @c=601<cr>
"
"    " === Number every operation in code (echo mynr for value) ===
"nnoremap <leader>n ma:let g:mynr=0<cr>
"                   \gg/^T<cr>
"                   \:.,$s:^(\\w\\+.\\+$:\\="N" . Incr(10) . " " . submatch(0):g<cr>
"                   \gg/^G17<cr>:nohls<cr>
"
"    " === Write number and operation name (Repeat for every operation) ===
"nnoremap <leader>m mazr:let @c=g:mynr / 10<cr>
"                   \gg@c/^N\\d\\+<cr>"syy`a"sPwxi- <esc>I(<esc>0
"                   \:call Decr(10)<cr>:nohls<cr>

" }}}

    " XXX === "Other key combinations" === {{{

    " === Map H and L to move to the last or first character ===
"nnoremap H 0
"nnoremap L $

    " H moves you to the first(non)blank character (alternating between)
nnoremap H :call LineHome()<CR>:echo<CR>
    " L moves you to the last(non)blank character (alternating between)
nnoremap L :call LineEnd()<CR>:echo<CR>
    " M moves you to the middle of the line
nnoremap M :call LineMid()<CR>:echo<CR>

" LineHome and LineEnd functions {{{
function! LineHome()
  let x = col('.')
  execute "normal ^"
  if x == col('.')
    execute "normal 0"
  endif
  return ""
endfunction

function! LineMid()
  let x = col('$')/2
  let y = line('.')
  execute "call cursor(y,x)"
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

    " === Set middle mouse button to toggle folds ===
nnoremap <MiddleMouse> za
nnoremap <2-MiddleMouse> za
nnoremap <3-MiddleMouse> za
nnoremap <4-MiddleMouse> za
vnoremap <MiddleMouse> za
vnoremap <2-MiddleMouse> za
vnoremap <3-MiddleMouse> za
vnoremap <4-MiddleMouse> za
    
    " === Map the ; as : for entering a command ===
nnoremap ; :

    " === Yank up to the end of line ===
nnoremap Y y$

    " === Remap j and k to move on the next line of window without jumping wrapped text ===
nnoremap j gj
nnoremap k gk

    " === Map F2 for toggling NERDTree and F3 for bookmark loading ===
nmap <F2> :NERDTreeToggle<cr>
nmap <F3> :NERDTree 
    " === Map F4 to open _vimrc and F5 to reload _vimrc ===
nmap <F4> :vsplit $myvimrc<cr>
nmap <F5> :source $myvimrc<cr>:nohls<cr>
    " === Map F10 to return the syntax highlighting group of the item under the cursor
nmap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
\ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
\ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
\ . "> hexfg<" . synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")
\ . "> hexbg<" . synIDattr(synIDtrans(synID(line("."), col("."), 1)), "bg") . ">"<CR><CR>
"nnoremap <silent> <leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

    " === Search inside visual range ===
  "A much simpler version is to: make your visual selection and then hit <ESC>
  "(returning to normal mode). Then prepend \%V to your search, like this:
  "/\%V[pattern]
" function! RangeSearch(direction)
"   call inputsave()
"   let g:srchstr = input(a:direction)
"   call inputrestore()
"   if strlen(g:srchstr) > 0
"     let g:srchstr = g:srchstr.
"           \ '\%>'.(line("'<")-1).'l'.
"           \ '\%<'.(line("'>")+1).'l'
"   else
"     let g:srchstr = ''
"   endif
" endfunction
" vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
" vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>

  "Another version without a functions
vnoremap / <Esc>/\\%><C-R>=line("'<")-1<CR>l\\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\\%><C-R>=line("'<")-1<CR>l\\%<<C-R>=line("'>")+1<CR>l
" }}}

    " XXX === "Movement mappings" === {{{
" for testing: as as (dap fa) sad [asssd d ] ad { saddasd} sadads 
    "Inside "(" parantheses
:onoremap ip i(

    "Inside "[" parantheses
:onoremap is i[

    "Inside "{" curly parantheses
:onoremap ic i{

    "Inside next "(" parantheses
:onoremap inp :<C-u>normal! f(vi(<cr>

    "Inside last "(" parantheses
:onoremap ilp :<C-u>normal! F)vi(<cr>

    "Inside next "[" square braces
:onoremap ins :<C-u>normal! f[vi[<cr>

    "Inside last "[" square braces
:onoremap ils :<C-u>normal! F]vi[<cr>

    "Inside next "{" curly braces
:onoremap inc :<C-u>normal! f{vi{<cr>

    "Inside last "{" curly braces
:onoremap ilc :<C-u>normal! F}vi{<cr>
" }}}

    " XXX === "Disabled keys" === {{{

    " === To help yourself learning efficient editing methods
    " in insert, normal and visual mode
    " unbind the "cursor keys" along with "Backspace" and "Delete" ===
for prefix in ['i', 'n', 'v']
  "for key in ['<Up>', '<Down>', '<Left>', '<Right>', '<bs>']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
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

" Custom Commands: 
" {{{
"nnoremap ,c :s:\\(.\\):\\1ø:g<cr>$x:s:[^ø]:\\=char2nr(submatch(0)):g<cr>:s:\\d\\+:\\=submatch(0) + 9:g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 12 . "ø" . (submatch(2) + 23) . "ø" . (submatch(3) + 26) . "ø" . (submatch(4) + 7):g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 10 . "ø" . (submatch(2) - 13) . "ø" . (submatch(3) - 14):g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 1 . "ø" . (submatch(2) - 1):g<cr>:s:ø: :g<cr>:s:\\d\\+:\\=nr2char(submatch(0)):g<cr>:s:\\s::g<cr>:nohls<cr>
"nnoremap ,d :s:\\(.\\):\\1ø:g<cr>$x:s:[^ø]:\\=char2nr(submatch(0)):g<cr>:s:\\d\\+:\\=submatch(0) - 9:g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 12 . "ø" . (submatch(2) - 23) . "ø" . (submatch(3) - 26) . "ø" . (submatch(4) - 7):g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 10 . "ø" . (submatch(2) + 13) . "ø" . (submatch(3) + 14):g<cr>:s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 1 . "ø" . (submatch(2) + 1):g<cr>:s:\\d\\+:\\=nr2char(submatch(0)):g<cr>:s:ø::g<cr>:nohls<cr>
command! -range Code <line1>,<line2>s:\\(.\\):\\1ø:g | <line1>,<line2>s:[^ø]:\\=char2nr(submatch(0)):g | <line1>,<line2>s:\\d\\+:\\=submatch(0) + 9:g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 12 . "ø" . (submatch(2) + 23) . "ø" . (submatch(3) + 26) . "ø" . (submatch(4) + 7):g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 10 . "ø" . (submatch(2) - 13) . "ø" . (submatch(3) - 14):g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 1 . "ø" . (submatch(2) - 1):g | <line1>,<line2>s:ø: :g | <line1>,<line2>s:\\d\\+:\\=nr2char(submatch(0)):g | <line1>,<line2>s:\\s::g | nohls
command! -range Decode <line1>,<line2>s:\\(.\\):\\1ø:g | <line1>,<line2>s:[^ø]:\\=char2nr(submatch(0)):g | <line1>,<line2>s:\\d\\+:\\=submatch(0) - 9:g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 12 . "ø" . (submatch(2) - 23) . "ø" . (submatch(3) - 26) . "ø" . (submatch(4) - 7):g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 10 . "ø" . (submatch(2) + 13) . "ø" . (submatch(3) + 14):g | <line1>,<line2>s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 1 . "ø" . (submatch(2) + 1):g | <line1>,<line2>s:\\d\\+:\\=nr2char(submatch(0)):g | <line1>,<line2>s:ø::g | nohls
"command! -range Code s:\\(.\\):\\1ø:g | s:[^ø]:\\=char2nr(submatch(0)):g | s:\\d\\+:\\=submatch(0) + 9:g | s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 12 . "ø" . (submatch(2) + 23) . "ø" . (submatch(3) + 26) . "ø" . (submatch(4) + 7):g | s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 10 . "ø" . (submatch(2) - 13) . "ø" . (submatch(3) - 14):g | s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 1 . "ø" . (submatch(2) - 1):g | s:ø: :g | s:\\d\\+:\\=nr2char(submatch(0)):g | s:\\s::g | nohls  
"command! -range Decode s:\\(.\\):\\1ø:g | s:[^ø]:\\=char2nr(submatch(0)):g | s:\\d\\+:\\=submatch(0) - 9:g | s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 12 . "ø" . (submatch(2) - 23) . "ø" . (submatch(3) - 26) . "ø" . (submatch(4) - 7):g | s:\\(\\d\\+\\)ø\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) + 10 . "ø" . (submatch(2) + 13) . "ø" . (submatch(3) + 14):g | s:\\(\\d\\+\\)ø\\(\\d\\+\\):\\=submatch(1) - 1 . "ø" . (submatch(2) + 1):g | s:\\d\\+:\\=nr2char(submatch(0)):g | s:ø::g | nohls  

" Format G code (use it to delete/add whitespaces and leading/trailing zeros before/after decimal point in G-Code Fanuc)
"command! -range FGC <line1>,<line2>s:\\(\\d\\)\\(\\a\\):\\1 \\2:ge | <line1>,<line2>s:\\(\\.\\)\\(\\D\\):\\1 \\2:ge | <line1>,<line2>s:\\(\\a\\)\\s\\+\\(\\d\\):\\1\\2:ge | <line1>,<line2>s:\\(\\a\\)\\s\\+\\(\\.\\):\\1\\2:ge | <line1>,<line2>s:\\(\\a\\)\\s\\+\\(-\\):\\1\\2:ge | <line1>,<line2>s:\\(\\a\\)\\(\\.\\):\\10\\2:ge | <line1>,<line2>s:\\(\\-\\)\\(\\.\\):\\10\\2:ge | <line1>,<line2>s:\\(\\.\\)\\(\\s\\):\\10\\2:ge | <line1>,<line2>s:\\(\\d\\)\\s\\{2,}\\(\\a\\):\\1 \\2:ge | nohls
command! -range FGC <line1>,<line2>s:\\(\\d\\)\\(\\a\\):\\1 \\2:ge | <line1>,<line2>s:\\(\\.\\)\\(\\D\\):\\1 \\2:ge | <line1>,<line2>s:\\(\\a\\)\\s\\+\\(\\d\\):\\1\\2:ge | <line1>,<line2>s:\\(\\a\\)\\s\\+\\(\\.\\):\\1\\2:ge | <line1>,<line2>s:\\(\\a\\)\\s\\+\\(-\\):\\1\\2:ge | <line1>,<line2>s:\\(\\a\\)\\(\\.\\):\\10\\2:ge | <line1>,<line2>s:\\(\\-\\)\\(\\.\\):\\10\\2:ge | <line1>,<line2>s:\\(\\.\\)\\(\\s\\):\\10\\2:ge | <line1>,<line2>s:\\s\\{2,}: :ge | nohls
" }}}

" Abrevs:
" {{{
"echo ">^.^<"
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

abbrev helptsave helptags $HOME/vimfiles/doc
" }}}

" Autogroups:
" {{{ GCodeHAAS
augroup gcodehaas
  "to clear the group before loading
  "If you lose current file settings, save the file and use ":e" to reload it
  autocmd!
  au FileType gcodehaas setlocal commentstring=(%s)

  function! BlockFoldM06()
     let thisline = getline(v:lnum)
     if match(thisline, 'M06') >= 0
        return ">1"
     else
        return "="
     endif
  endfunction

  au FileType gcodehaas setlocal foldmethod=expr
  au FileType gcodehaas setlocal foldexpr=BlockFoldM06()
augroup END
" For help tags run the command :helptags $vim/vim73/doc
" Also if you have any help files make sure to put them there
" }}}
" {{{ Python
augroup pythons
  autocmd!
  " === Map F9 to run python script ===
  au FileType python map <buffer> <F9> <esc>:w<cr>:execute '!python %'<cr> 
  au FileType python map <buffer> <F8> <esc>:w<cr>:execute "!kivy_venv\\\\Scripts\\\\activate"<cr>
  "au FileType python map <buffer> <F9> <esc>:w<cr>:exec '!python3 <c-r>=expand("%:p")<cr>'<cr> 
  "au FileType python map <buffer> <F9> <esc>:w<cr>:exec '!python3' shellescape(@%, 1)<cr>
  ":execute "%"<cr>
augroup END
" }}}

" Disabled
" {{{ Text files
"augroup txtfiles
"  autocmd!
"  " === Map F6/F7/F8/F9 to mark line with + * ? or remove mark ===
"  au FileType txtfiles nmap <buffer> <F6> ma0w:let b=col('.')<cr>
"        \:if b%2==1<cr>normal h<cr>endif<cr>r+`a:echo "+ inserted!"<cr>
"  au FileType txtfiles nmap <buffer> <F7> ma0w:let b=col('.')<cr>
"        \:if b%2==1<cr>normal h<cr>endif<cr>r*`a:echo "* inserted!"<cr>
"  au FileType txtfiles nmap <buffer> <F8> ma0w:let b=col('.')<cr>
"        \:if b%2==1<cr>normal h<cr>endif<cr>r?`a:echo "? inserted!"<cr>
"  au FileType txtfiles nmap <buffer> <F9> ma0w:let b=col('.')<cr>
"        \:if b%2==1<cr>normal h<cr>endif<cr>r `a:echo "mark removed!"<cr>
"augroup END
" }}}
" {{{ code files
"augroup sfm_custom_missions_2
"  autocmd!
"  au FileType sfm_custom_missions_2 setlocal tabstop=8
"  au FileType sfm_custom_missions_2 setlocal shiftwidth=0
"  au FileType sfm_custom_missions_2 setlocal softtabstop=0
"  au FileType sfm_custom_missions_2 setlocal nosmarttab
"  au FileType sfm_custom_missions_2 setlocal noexpandtab
"augroup END
" }}}

" Commented Out:
" {{{
" Examples:
" For counting found pattern
" :let n=[0] | bufdo %s/pattern\zs/\=map(n,'v:val+1')[1:]/ge

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
"nmap <M-a> \"ap
"nmap <M-A> \"aP
"nmap <M-s> \"sp
"nmap <M-S> \"sP
"nmap <M-d> \"dp
"nmap <M-D> \"dP
"nmap <M-f> \"fp
"nmap <M-F> \"fP
"nmap <M-g> \"gp
"nmap <M-G> \"gP
"nmap <M-z> \"zp
"nmap <M-Z> \"zP
"nmap <M-x> \"xp
"nmap <M-X> \"xP
"nmap <M-c> \"cp
"nmap <M-C> \"cP
"nmap <M-v> \"vp
"nmap <M-V> \"vP
"nmap <M-b> \"bp
"nmap <M-B> \"bP
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
" }}}

"" CSharp:
"" {{{
"augroup csharp
"  "to clear the group before loading
"  "If you lose current file settings, save the file and use ":e" to reload it
"  autocmd!
"  au FileType cs :iabbrev <buffer> forr for (int i = 0; i < ; i++)<esc>5hi<c-r>=Eatchar('\m\s\<bar>/')<cr>
"  au FileType cs :iabbrev <buffer> iff if ()<esc>i<c-r>=Eatchar('\m\s\<bar>/')<cr>
"  au FileType cs :iabbrev <buffer> whilee while ()<esc>i<c-r>=Eatchar('\m\s\<bar>/')<cr>
"  au FileType cs :iabbrev <buffer> {} {}<esc>i<return><esc><S-O><c-r>=Eatchar('\m\s\<bar>/')<cr>
"  au FileType cs :iabbrev <buffer> tmethod [TestMethod]<return>public void ()<return>{<return>}<esc>2k$hi<c-r>=Eatchar('\m\s\<bar>/')<cr>
"  au FileType cs :iabbrev <buffer> aae Assert.AreEqual();<esc>hi<c-r>=Eatchar('\m\s\<bar>/')<cr>
"  au FileType cs :iabbrev <buffer> caae CollectionAssert.AreEqual();<esc>hi<c-r>=Eatchar('\m\s\<bar>/')<cr>
"  au FileType cs setlocal shiftwidth=4 tabstop=4
"  au FileType cs setlocal foldmarker={,}
"  "au FileType cs setlocal foldmarker=fs,fe
"augroup END
"" For help tags run the command :helptags $vim/vim73/doc
"" Also if you have any help files make sure to put them there
"" }}}
" }}}
