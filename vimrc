set nocompatible

" Swap ; and :
nnoremap ; :

execute "set rtp+=".expand("<sfile>:h")."/vim"

" Load Bundles:
" =============
if (has('macunix'))
    " Mac needs filetype to be toggled, else vim's return code will be nonzero
    filetype on
    filetype off
endif
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:vundle_default_git_proto = 'git'
Bundle 'VundleVim/vundle.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-sensible'
"Bundle 'altercation/vim-colors-solarized'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'airblade/vim-gitgutter'
" Bundle 'scrooloose/syntastic'
Bundle 'rodjek/vim-puppet'
Bundle 'godlygeek/tabular'
Bundle 'mitsuhiko/vim-jinja'
Bundle 'kchmck/vim-coffee-script'

call vundle#end()

" Man page viewer
source $VIMRUNTIME/ftplugin/man.vim

" Fortran
let fortran_free_source=1

" Syntax highlighting
filetype on
filetype plugin indent on
syntax enable
set background=dark
"colorscheme solarized
let c_space_errors = 1
let c_C99 = 1
let c_impl_defined = 1

let fortran_do_enddo=1

" Don't put fortran module files from syntax checking in the current directory
"let g:syntastic_fortran_compiler_options="-J/tmp -fimplicit-none"

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

set foldlevelstart=99

let g:git_email=substitute(system('git config --global --get user.email'), '^\s*\(.\{-}\)\s*\n','\1','')
let g:git_name=substitute(system('git config --global --get user.name'), '^\s*\(.\{-}\)\s*\n','\1','')

autocmd BufNewFile,BufRead *.pfunit set filetype=fortran
autocmd BufNewFile,BufRead *.pf set filetype=fortran
autocmd BufNewFile,BufRead *.f90,*.F90,*.pf :compiler ifort

autocmd BufNewFile *.c,*.cpp,*.h,*.hpp 0r <sfile>:h/vim/templates/c
autocmd BufNewFile *.f90 0r <sfile>:h/vim/templates/f
autocmd BufNewFile *.sh 0r <sfile>:h/vim/templates/sh
autocmd BufNewFile *.py 0r <sfile>:h/vim/templates/py
autocmd BufNewFile *.h $r <sfile>:h/vim/templates/h
autocmd BufNewFile *.hpp $r <sfile>:h/vim/templates/hpp
autocmd BufNewFile *.pp 0r <sfile>:h/vim/templates/pp
autocmd BufNewFile *.pbs 0r <sfile>:h/vim/templates/pbs
fun ReplacePlaceholders()
    %s/<FILE>/\=expand("%")/ge
    %s/<YEAR>/\=strftime("%Y")/ge
    %s/<GUARD>/\=substitute(toupper(fnamemodify(expand("%"),":t")),"\\.","_","g")/ge
    %s/<AUTHOR>/\=g:git_name . ' <'.g:git_email.'>'/ge
    %s/<COPYOWNER>/\=g:git_name/ge
endfun
autocmd BufNewFile *.c,*.cpp,*.h,*.hpp,*.f90 call ReplacePlaceholders()|normal G
autocmd BufNewFile *.sh,*.py,*.pp call ReplacePlaceholders()|normal G
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:clang_library_path="/usr/lib"

let g:syntastic_fortran_compiler="ifort"
