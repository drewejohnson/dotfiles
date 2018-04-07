set enc=utf-8
set fileencoding=utf-8
set number
set nocompatible
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'lervag/vimtex'

call vundle#end()

"powerline
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim
set laststatus=2
set showtabline=2
set noshowmode 
filetype plugin indent on
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2' 
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
set tabstop=4 expandtab softtabstop=0 shiftwidth=4 smarttab
" navigate through split screens with normal navigation commands
map <C-J> <C-W>j
map <C-H> <C-W>h
map <C-K> <C-W>k
map <C-L> <C-W>l

" spellcheck
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=011
hi clear SpellLocal
hi SpellLocal cterm=underline ctermfg=012
