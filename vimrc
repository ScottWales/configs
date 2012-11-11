set nocompatible

" Load Bundles:
" =============
filetype off
execut "set rtp+=".expand("<sfile>:h")."/vim/bundle/vundle"
call vundle#rc()
let g:vundle_default_git_proto = 'git'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'

" Fortran
let fortran_free_source=1

" Syntax highlighting
filetype on
filetype plugin on
syntax enable

set showcmd

set ruler
" Tab handling
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Swap ; and :
nnoremap ; :
nnoremap : ;

" Indenting
set cinoptions=(0 " Align at open brackets
