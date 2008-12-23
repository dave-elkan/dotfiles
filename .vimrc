if exists("&anti")
	set anti
endif
set ff=unix
" set mouse=a
" set gui options
if has("gui_running")
	" position
	"winp 0 0
	" width/height
	set lines=80
	set columns=200
	set guifont=Monaco:h13
	set guioptions-=T
	set fuoptions=maxvert,maxhorz
	set cursorline
	colorscheme wombat
endif
if !has("gui_running")
	colorscheme desert
endif
filetype on
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
syntax on
set spelllang=en_au
set title
set ttyfast
set hidden
" restore size of vim window when restoring session
set sessionoptions+=resize
"set textwidth=110
set history=1000
set t_Co=256
runtime macros/matchit.vim

" catch trailing whitespace
set listchars=tab:>-,trail:�,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" titeInhibit, allows vim contents to be available on screen after exit
" set t_ti= t_te=

" to recognise objective-c lex and yacc files
au BufRead,BufNewFile *.lm		set filetype=lex
au BufRead,BufNewFile *.ym		set filetype=yacc

" webpy template files
au BufRead,BufNewFile *.pyt		set filetype=python
au BufRead,BufNewFile *.pyt		set filetype=python

" for cocoa and objc syntax highlighting
au BufRead,BufNewFile *.m		set filetype=cocoa | set textwidth=0
au BufRead,BufNewFile *.h		set filetype=cocoa | set textwidth=0

" turn spell checking on for txt files
au BufRead,BufNewFile *.txt		setlocal spell spelllang=en_au

" LaTeX
au BufRead,BufNewFile *.tex		set wrap | set textwidth=110 | set nonu
au BufLeave,BufUnload *.tex		set nowrap | set textwidth=0 | set nu
" mapping for wordcount
nnoremap <silent> <Leader>w :!/usr/texbin/detex % \| wc -w<CR>
filetype indent on
filetype plugin on

" copy to system clipboard, if in visual mode grab selected, otherwise grab just the current line
"map <F1> :.w !pbcopy<CR><CR>
"map <F1> :w !pbcopy<CR><CR>
"" paste contents from system clipboard
"map <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
"map <F2> <ESC>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

map <F2> :!python -m py_compile %<CR>
map <F3> :let @/=""<CR>
map <F4> :FuzzyFinderTextMate<CR>
map <F5> :ruby finder.rescan!<CR>

" TVO
let otl_map_tabs = 1
au BufRead,BufNewFile *.otl		set tw=80 | set ts=3 | set sw=3 | set foldlevel=10 | set fo-=t
au BufLeave,BufUnload *.otl		set tw=0 | set ts=4 | set sw=4 | set foldlevel=0 | set fo=tcq

" A - header switching plugin
let g:alternateExtensions_m = "h"
let g:alternateExtensions_h = "m"

" FuzzyFinderTextMate
let g:fuzzy_roots = ['/Volumes/www/', '/Users/Basil/dotfiles/', '/Users/Basil/.vim/secure/', '/Users/Basil/Development/iphone/Property Machine/']

" VimWiki
let g:vimwiki_home = '$HOME/.vim/wiki/'
