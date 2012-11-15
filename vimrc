set nocompatible

" Swap ; and :
nnoremap ; :
nnoremap : ;

let hostname = substitute(system('hostname'),'\n','','')

" Load Bundles:
" =============
" Mac needs filetype to be toggled, else vim's return code will be nonzero
filetype on
filetype off
if hostname != 'accesscollab' " Collab doesn't have git
    execute "set rtp+=".expand("<sfile>:h")."/vim/bundle/vundle"
    call vundle#rc()
    let g:vundle_default_git_proto = 'git'
    Bundle 'gmarik/vundle'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-git'
    Bundle 'Rip-Rip/clang_complete'
    Bundle 'altercation/vim-colors-solarized'
endif

" Fortran
let fortran_free_source=1

" Syntax highlighting & colours
filetype plugin indent on
syntax enable
set background=dark
set t_Co=256
colorscheme solarized

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
