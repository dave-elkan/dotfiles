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
	set lines=66
	set columns=153
	set guifont=Monaco:h16
	set guioptions-=T
	set fuoptions=maxvert,maxhorz
	set cursorline
	colorscheme wombat
endif
if !has("gui_running")
	colorscheme desert
endif
filetype on
"clears search buffer
nnoremap <silent> <F3> :let @/=""<CR>
set wildmode=longest,list
set background=dark
set hlsearch
set nu
set nocompatible
set ignorecase
set smartcase
set incsearch
" set scrolloff=2
set nowrap
"horizontal scrollbar
"set guioptions+=b
set wrap
set showmatch
"not working with macvim
set ruler
set shiftwidth=4
set tabstop=4
set autoindent
set cindent
set noerrorbells
set backspace=start,indent,eol
syntax on
set spelllang=en_au
" restore size of vim window when restoring session
set sessionoptions+=resize
set textwidth=110
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
nmap <F1> :.w !pbcopy<CR><CR>
vmap <F1> :w !pbcopy<CR><CR>
" paste contents from system clipboard
nmap <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F2> <ESC>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

nmap <F3> :let @/=""<CR>
nmap <F4> :Drill<CR>

" TVO
let otl_map_tabs = 1
au BufRead,BufNewFile *.otl		set tw=80 | set ts=3 | set sw=3 | set foldlevel=10 | set fo-=t
au BufLeave,BufUnload *.otl		set tw=0 | set ts=4 | set sw=4 | set foldlevel=0 | set fo=tcq

" A - header switching plugin
let g:alternateExtensions_m = "h"
let g:alternateExtensions_h = "m"
