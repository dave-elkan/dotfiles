" Pathogen
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

if exists("&anti")
	set anti
endif
set ff=unix
if has("gui_running")
	" width/height
	set lines=80
	set columns=225
	set guifont=Monaco:h14
	set guioptions-=T
	set fuoptions=maxvert,maxhorz
	set cursorline
	colorscheme xoria256
else
	colorscheme desert
endif
filetype on
syntax on
runtime macros/matchit.vim
set wildmode=longest,list
set background=dark
set hlsearch
set nu
set nocompatible
set ignorecase
set smartcase
set incsearch
set nowrap
set wrap
set showmatch
set ruler
set shiftwidth=4
set tabstop=4
set autoindent
set cindent
set noerrorbells
set backspace=start,indent,eol
set title
set ttyfast
set hidden
set history=1000
set t_Co=256
set directory=~/.vim/tmp
set backup
set backupdir=~/.vim/backup
set laststatus=2
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]%{fugitive#statusline()}
set wildignore+=*.o,*.obj,*.pyc,*.DS_Store,*.db"
filetype indent on
filetype plugin on

" Restore size of vim window when restoring session
set sessionoptions+=resize

" Turn off the blinking cursor in normal mode:
set gcr=n:blinkon0

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>f :set nolist!<CR>

" Turn spell checking on for .txt files
au BufRead,BufNewFile *.txt		setlocal spell spelllang=en_au

map <F3> :let @/=""<CR>
map <F4> :CommandTFlush<CR>
nnoremap <F5> :GundoToggle<CR>

" A - header switching plugin
let g:alternateExtensions_m = "h"
let g:alternateExtensions_h = "m"

" Command-T
let g:CommandTMaxFiles = 100000
let g:CommandTMaxDepth = 8
cd ~/Development
nmap <silent> <Leader>t :CommandT<CR>

" Bindings so Vim inside of Tmux works.
map [5C <Right>
map [5D <Left>

" clang_complete
let g:clang_complete_auto = 0

" Toggle quickfix window (http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window)
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
	if exists("g:qfix_win") && a:forced == 0
		cclose
		unlet g:qfix_win
	else
		copen 10
		let g:qfix_win = bufnr("$")
	endif
endfunction
nmap <silent> \\ :QFix<CR>

" Tell vim to remember certain things when we exit
" "  '10 : marks will be remembered for up to 10 previously edited files
" "  "100 : will save up to 100 lines for each register
" "  :20 : up to 20 lines of command-line history will be remembered
" "  % : saves and restores the buffer list
" "  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" When we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

" From http://vim.wikia.com/wiki/Pretty-formatting_XML
function! DoPrettyXML()
	" save the filetype so we can restore it later
	let l:origft = &ft
	set ft=
	" delete the xml header if it exists. This will
	" permit us to surround the document with fake tags
	" without creating invalid xml.
	1s/<?xml .*?>//e
	" insert fake tags around the entire document.
	" This will permit us to pretty-format excerpts of
	" XML that may contain multiple top-level elements.
	0put ='<PrettyXML>'
	$put ='</PrettyXML>'
	silent %!xmllint --format -
	" xmllint will insert an <?xml?> header. it's easy enough to delete
	" if you don't want it.
	" delete the fake tags
	2d
	$d
	" restore the 'normal' indentation, which is one extra level
	" too deep due to the extra tags we wrapped around the document.
	silent %<
	" back to home
	1
	" restore the filetype
	exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

let g:alternateExtensions_h = "c,m,cc,mm"
let g:alternateExtensions_cc = "h"
let g:alternateExtensions_mm = "h"
