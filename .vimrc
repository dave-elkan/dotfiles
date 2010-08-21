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
	set columns=200
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

" A - header switching plugin
let g:alternateExtensions_m = "h"
let g:alternateExtensions_h = "m"

" Command-T
let g:CommandTMaxFiles=1000000
cd ~/Development
