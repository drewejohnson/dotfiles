" my vimrc file
"                              general settings     {
set fileencoding=utf-8
set number
set nocompatible
set wildmenu
set incsearch
set showcmd
colorscheme zellner
syntax on
filetype off

" }

"                          vundle plugin management     {
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
Plugin 'thinca/vim-quickrun'
Plugin 'Konfekt/FastFold'
Plugin 'tmhedberg/SimpylFold'

call vundle#end()
filetype plugin indent on

set tabstop=4 expandtab softtabstop=0 shiftwidth=4 smarttab

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
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'

" }

" navigate through split screens with normal navigation commands
nnoremap <C-J> <C-W>j
nnoremap <C-H> <C-W>h
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l


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

" }

au BufRead,BufNewFile *.py match BadWhitespace /\s+$/

"                                  leaders      {
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" file editing a. la. Steve Losh    {
nnoremap <leader>ev :tabe ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>ei :tabe ~/.config/i3/config<CR>

" }
" fugitive  {

noremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
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
    au FileType python nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au FileType python nnoremap <buffer> <localleader>q :QuickRun<CR>
    au FileType python vnoremap <buffer> <localleader>q :QuickRun<CR>

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

