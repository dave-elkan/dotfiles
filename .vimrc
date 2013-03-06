 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'Valloric/YouCompleteMe'
 Bundle 'wincent/Command-T'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'duganchen/vim-soy'
 Bundle 'derekwyatt/vim-scala'
 Bundle 'airblade/vim-gitgutter'
" vim-scripts repos
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " non github repos
 " Bundle 'git://git.wincent.com/command-t.git'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
 "
if exists("&anti")
        set anti
endif
set ff=unix
if has("gui_running")
        " width/height
        set lines=80
        set columns=260
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

set expandtab
set shiftround

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
set rnu

cd /Users/delkan/src
