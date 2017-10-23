" Use the Solarized Dark theme
set background=dark
colorscheme solarized
let g:solarized_termtrans=1


set nocompatible      	" We're running Vim, not Vi!
:set tabstop=2   				" 2 spaces bitches
syntax on             	" Enable syntax highlighting
filetype on           	" Enable filetype detection
filetype indent on    	" Enable filetype-specific indenting
filetype plugin on    	" Enable filetype-specific plugins
compiler ruby         	" Enable compiler support for ruby
set showmatch  		"Show matching bracets when text indicator is over them
set ruler

autocmd BufNewFile,BufRead *.markdown setfiletype octopress


nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Disable error bells
set noerrorbells

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the filename in the window titlebar
set title
