set nocompatible

" Swap ; and :
nnoremap ; :
nnoremap : ;

" Load Bundles:
" =============
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

let g:vundle_default_git_proto = 'git'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'altercation/vim-colors-solarized'
" Bundle 'Rip-Rip/clang_complete'

" Fortran
let fortran_free_source=1

" Syntax highlighting
filetype on
filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized
let c_space_errors = 1
let c_C99 = 1
let c_impl_defined = 1

" Status bar
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set showcmd

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

" Indenting
set cinoptions=(0 " Align at open brackets
