set nocompatible
set showcmd
set ruler
set laststatus=2

" Fortran
let fortran_free_source=1

" Syntax highlighting
filetype on
filetype plugin indent on
syntax enable

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
