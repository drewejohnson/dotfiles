" my vimrc file
set fileencoding=utf-8
set number
set nocompatible
set wildmenu
set incsearch
set showcmd
colorscheme zellner
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'nvie/vim-flake8'
Plugin 'michaeljsmith/vim-indent-object'

call vundle#end()

set tabstop=4 expandtab softtabstop=0 shiftwidth=4 smarttab

"Status line
" set :h statusline
set laststatus=2
set statusline=
set statusline+=%-10.3n\         " buffer number 
set statusline+=%f\              " file name
set statusline+=%h%m%r%w         " file types - help, modified, RO, preview
set showtabline=2
set noshowmode 
filetype plugin indent on

" youcompleteme
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'

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

" nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" nerdtree extension highlighting
" https://github.com/scrooloose/nerdtree/issues/433#issuecomment-92590696

function! NERDTreeHighlightFile(extension, fg, bg)
     exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg 
     exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('py', 'green', 'none')
call NERDTreeHighlightFile('yaml', 'yellow', 'none')
call NERDTreeHighlightFile('rst', 'blue', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none')

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" macros
let @d='yypv$r-'  " used for python doc strings

