" my vimrc file
"                              general settings     {
set fileencoding=utf-8
set number
set nocompatible
set mousehide  " hide mouse after typeing
set hlsearch
set splitright
set wildmenu
set wildignore+=*.o,*.pyc,*.pdf,*.mod,*.so,*.h.gch
set incsearch
set showcmd
set relativenumber
let fortran_free_source=1
syntax on

" directories   {
set directory=~/.vim/swap
set backupdir=~/.vim/backups

filetype off

" }

"                          vundle plugin management     {
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ajh17/VimCompletesMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'nvie/vim-flake8'
Plugin 'thinca/vim-quickrun'
Plugin 'Konfekt/FastFold'
Plugin 'tmhedberg/SimpylFold'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'vim-scripts/SyntaxAttr.vim'
" Turn off highlighting after a search
" Reenable it at next search and when jumping w/ n/N
Plugin 'romainl/vim-cool'
" Colorscheme
" Similar dark purple theme, but more minimal
" better for non-256 terminals
" Plugin 'axvr/photon.vim'
Plugin 'liuchengxu/space-vim-theme'

call vundle#end()

filetype plugin indent on

set tabstop=4 expandtab softtabstop=0 shiftwidth=0 smarttab

"                                 Functions         {

function! <SID>StripTrailingWhitespaces()
    " http://vimcasts.org/episodes/tidying-whitespace
    " Prep - save last search and cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the thing
    %s/\s\+$//e
    " Clean up - restore search history and cursor position
    let @/=_s
    call cursor(l,c)
endfunction

"   }

"                                Status line        {
set laststatus=2
set statusline=%f%m%r%h%w[%{&ff}]%y[%p%%][%l,%v]
" file path, modified, readonly, help flag, preview flag
" file format, file type, percentage, [line, col]
" }

" navigate through split screens with normal navigation commands
nnoremap <C-J> <C-W>j
nnoremap <C-H> <C-W>h
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
tnoremap <C-J> <C-W>j
tnoremap <C-H> <C-W>h
tnoremap <C-K> <C-W>k
tnoremap <C-L> <C-W>l


"                                highlighting       {
" spell check   {
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=011
highlight clear SpellLocal
highlight SpellLocal cterm=underline ctermfg=012
"}

" bad white space    {
highlight BadWhitespace ctermfg=012
" }
" }

au BufRead,BufNewFile *.py,*.tex,*.c,*.h,*.f90,*.f08 match BadWhitespace /\s+$/
au BufWritePre *.py,*.tex,*.c,*.h,*.f90,*.f08 :call <SID>StripTrailingWhitespaces()

"                                  leaders      {

" file editing a. la. Steve Losh    {
nnoremap <leader>ev :tabe ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>ei :tabe ~/.config/i3/config<CR>

"   }

" Kill all whitespace
nnoremap <silent> <leader>kw :call <SID>StripTrailingWhitespaces()<CR>

" }
" fugitive  {

nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gca :Gcommit --amend<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gvd :Gvdiff<CR>
nnoremap <leader>gdp :diffput<CR>
nnoremap <leader>gdg :diffget<CR>
vnoremap <leader>gdp :diffput<CR>
vnoremap <leader>gdg :diffget<CR>

" }
" }

"                                  folding      {
nnoremap <Space> za
vnoremap <Space> za

" fast fold {
let g:tex_fold_enabled = 1

" }
" }

"                             File-type specific   {

" C         {
augroup ft_c
    au!
    au FileType c set foldmethod=syntax
    au FileType c set tabstop=2
augroup end

" }

" C++       {
augroup ft_cpp
    au!
    au FileType cpp  set foldmethod=syntax tabstop=2
augroup end

" }

" Fortran   {
augroup ft_fortran
    au!
    au FileType fortran let fortran_fold=1
    au FileType fortran let fortran_fold_conditionals=1
    au FileType fortran set tabstop=3 foldmethod=syntax
augroup end

" }

" LaTeX     {
augroup ft_latex
    au!

    " Build the document using rubber and generate a pdf
    au FileType tex nnoremap <buffer> <localleader>1 :! rubber -d %<CR>

augroup end

" }

" Python {
augroup ft_python
    au!

    au FileType python inoremap <buffer> <c-b> """"""<left><left><left>
    au FileType python nnoremap <buffer> <localleader>1 yypv$r-:redraw<cr>
    au FileType python nnoremap <buffer> <localleader>q :QuickRun<CR>
    au FileType python vnoremap <buffer> <localleader>q :QuickRun<CR>
    au InsertEnter *.py syn clear BadWhitespace | syn match BadWhitespace excludenl /\s\+\%#\@!$/
    au InsertLeave *.py syn clear BadWhitespace | syn match BadWhitespace excludenl /\s\+$/

augroup end

" }
" ReStructuredText {

augroup ft_rest
    au!

    au FileType rst nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au FileType rst nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au FileType rst nnoremap <buffer> <localleader>3 yypVr~:redraw<cr>

augroup end

"}

"}

" Colorscheme {
set background=dark
colorscheme space_vim_theme
