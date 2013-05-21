set nocompatible

" Swap ; and :
nnoremap ; :
nnoremap : ;

execute "set rtp+=".expand("<sfile>:h")."/vim"

" Load Bundles:
" =============
" Mac needs filetype to be toggled, else vim's return code will be nonzero
filetype on
filetype off
execute "set rtp+=".expand("<sfile>:h")."/vim/bundle/vundle"
call vundle#rc()

let g:vundle_default_git_proto = 'git'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'altercation/vim-colors-solarized'
" Bundle 'Rip-Rip/clang_complete'
Bundle 'airblade/vim-gitgutter'

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

let fortran_do_enddo=1

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

autocmd BufNewFile *.c,*.cpp,*.h,*.hpp 0r <sfile>:h/vim/templates/c
autocmd BufNewFile *.f90 0r <sfile>:h/vim/templates/f
autocmd BufNewFile *.sh 0r <sfile>:h/vim/templates/sh
autocmd BufNewFile *.py 0r <sfile>:h/vim/templates/py
autocmd BufNewFile *.h $r <sfile>:h/vim/templates/h
autocmd BufNewFile *.hpp $r <sfile>:h/vim/templates/hpp
fun ReplacePlaceholders()
    %s/<FILE>/\=expand("%")/ge
    %s/<YEAR>/\=strftime("%Y")/ge
    %s/<GUARD>/\=substitute(toupper(expand("%")),"\\.","_","g")/ge
    %s/<AUTHOR>/Scott Wales <scott.wales@unimelb.edu.au>/ge
endfun
autocmd BufNewFile *.c,%.cpp,*.h,*.f90 call ReplacePlaceholders()|normal G
autocmd BufNewFile *.sh,*.py call ReplacePlaceholders()|normal G
