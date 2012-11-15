set nocompatible

" Swap ; and :
nnoremap ; :
nnoremap : ;

" Load Bundles:
" =============
filetype on
filetype off
execute "set rtp+=".expand("<sfile>:h")."/vim/bundle/vundle"
call vundle#rc()
let g:vundle_default_git_proto = 'git'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'Rip-Rip/clang_complete'

" Fortran
let fortran_free_source=1

" Syntax highlighting
filetype plugin indent on
syntax enable

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
