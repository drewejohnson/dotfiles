" my vimrc file
"                              general settings     {
set fileencoding=utf=8
set number
set nocompatible
set mousehide  " hide mouse after typeing
set hlsearch
set splitright
set wildmenu
set wildignore+=*.o,*.pyc,*.pdf
set incsearch
set showcmd
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
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'nvie/vim-flake8'
Plugin 'thinca/vim-quickrun'
Plugin 'Konfekt/FastFold'
Plugin 'tmhedberg/SimpylFold'
Plugin 'morhetz/gruvbox'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/promptline.vim'
" Plugin 'vim-scripts/SyntaxAttr.vim'
" Turn off highlighting after a search
" Reenable it at next search and when jumping w/ n/N
Plugin 'romainl/vim-cool'

call vundle#end()

" Colorscheme
set background=dark
let g:gruvbox_contrast_dark = 'high'
colorscheme gruvbox
filetype plugin indent on

set tabstop=4 expandtab softtabstop=0 shiftwidth=4 smarttab

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
set statusline=
set statusline+=%-10.3n\         " buffer number
set statusline+=%f\              " file name
set statusline+=%h%m%r%w         " file types - help, modified, RO, preview
set showtabline=2
set noshowmode

" }

"                               youcompleteme       {
" let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_python_binary_path = '/usr/bin/python3'

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

"                                  nerdtree     {
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree coloring  {
" https://github.com/scrooloose/nerdtree/issues/433#issuecomment-92590696

function! NERDTreeHighlightFile(extension, fg, bg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction


call NERDTreeHighlightFile('py', 'green', 'none')
call NERDTreeHighlightFile('yaml', 'yellow', 'none')
call NERDTreeHighlightFile('rst', 'blue', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none')

" }
" }

" bad white space    {
highlight BadWhitespace ctermfg=012
" }
" }

"                                  airline      {
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" }

"                                 virtualenv    {
let g:virtualenv_auto_activate = 1

" }

"                                 promptline    {

let g:promptline_preset = {
    \'a': [promptline#slices#host({'only_if_ssh': 1}), promptline#slices#python_virtualenv() ],
    \'b': [promptline#slices#user() ],
    \'c': [promptline#slices#cwd() ],
    \'y': [promptline#slices#vcs_branch(), promptline#slices#git_status() ],
    \'warn': [promptline#slices#last_exit_code() ]}
"

au BufRead,BufNewFile *.py,*.tex,*.c,*.h match BadWhitespace /\s+$/
au BufWritePre *.py,*.tex,*.c,*.h,*.f90 :call <SID>StripTrailingWhitespaces()

"                                  leaders      {
" nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

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
augroup end

" }

" Fortran   {
augroup ft_fortran
    au!
    au FileType fortran let fortran_free_source=1
    au FileType fortran let fortran_fold=1
    au FileType fortran let fortran_fold_conditionals=1
    au FileType fortran set foldmethod=syntax
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

