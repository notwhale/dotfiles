" -----------------------------------------------------------------------------
" Vim-Plug autoinstall
" -----------------------------------------------------------------------------

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'yggdroot/indentline'
call plug#end()

" -----------------------------------------------------------------------------
" Plugins settings
" -----------------------------------------------------------------------------

let python_highlight_all = 1

let mapleader=" "
let maplocalleader=" "

let g:indentLine_char = '⦙'

let g:SimpylFold_docstring_preview=1

"let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#virtualenv#enabled = 1
"let g:airline_skip_empty_sections = 1

let NERDTreeIgnore=['\.pyc$', '^__pycache__$', '\~$']

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

"let g:coc_global_extensions = [
    "\ 'coc-sh',
    "\ 'coc-markdownlint',
    "\ 'coc-vimlsp',
    "\ 'coc-json',
    "\ 'coc-pyright',
    "\ 'coc-yaml',
    "\ 'coc-yank',
    "\ 'coc-highlight',
    "\ 'coc-docker',
    "\ ]

let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 0
let g:ale_lsp_suggestions = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'never'
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1
let g:ale_linters = {
    \ 'yaml': ['yamllint'],
    \ 'python': ['flake8', 'pylint'],
    \ }
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'python': ['isort', 'yapf', 'black'],
    \ }
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" -----------------------------------------------------------------------------
" Core settings
" -----------------------------------------------------------------------------

syntax on
filetype on
filetype plugin on
filetype indent on

colorscheme gruvbox
set background=dark
set t_Co=256
set backspace=indent,eol,start
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf8,cp1251
set fileformats=unix,dos,mac
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldcolumn=2
set showtabline=2
set colorcolumn=79
set expandtab
set smarttab
set autoindent
set smartindent
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set timeoutlen=1000 ttimeoutlen=0
set updatetime=300
set shortmess+=c
set ttyfast
set lazyredraw
set showcmd
set wrap
set linebreak
set nobackup
set nowritebackup
set noswapfile
set nocompatible
set noerrorbells
set novisualbell
set undodir=~/.vim/undodir
set ruler
set number relativenumber
set splitbelow splitright
set mouse=a
set clipboard=unnamed,unnamedplus
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" -----------------------------------------------------------------------------
" Key mappings
" -----------------------------------------------------------------------------

" multiline movement
nmap j gj
nmap k gk

" movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" useful remaps
noremap x "_x
noremap X "_x
nnoremap Y yg_
vnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" move strings
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
inoremap ∆ <esc>:m .+1<CR>==gi
inoremap ˚ <esc>:m .-2<CR>==gi
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" identation
nnoremap <silent> > >>
nnoremap <silent> < <<
xnoremap <silent> < <gv
xnoremap <silent> > >gv

" brackets
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>

" some replacings
nnoremap <leader><CR> :let @/=''<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>T :%s/\t/    /g<CR>

" save and quit
nnoremap <silent> <Leader>s :w<CR>
nnoremap <silent> <Leader>S :w !sudo tee % > /dev/null
nnoremap <silent> <Leader>w <C-w>c
nnoremap <silent> <Leader>q :q!<CR>
nnoremap Q <Nop>

" paste
nnoremap <silent> <F1> :set invpaste paste?<CR>

" nerdtree
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" terminal
nnoremap <silent> <F3> :lcd %:p:h<CR>:belowright terminal<CR>
"nnoremap <silent> <F3> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

" search and replace
nnoremap <F4> :%s///gc<left><left><left><left>
nnoremap cn *``cgn
nnoremap cN *``cgN

" ALE
nmap <silent> <leader>a <Plug>(ale_next_wrap)
nmap <F10> :ALEFix<CR>

" tabs
map <leader>tn :tabnew<CR>
map <leader>tm :tabmove
map <leader>tc :tabclose<CR>
map <leader>to :tabonly<CR>

" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>F :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>
"nnoremap <silent> <leader>/ :BLines<CR>
"nnoremap <silent> <leader>' :Marks<CR>
"nnoremap <silent> <leader>gc :Commits<CR>
"nnoremap <silent> <leader>H :Helptags<CR>
"nnoremap <silent> <leader>hh :History<CR>
"nnoremap <silent> <leader>h: :History:<CR>
"nnoremap <silent> <leader>h/ :History/<CR>

" Close all buffers but current
nnoremap <leader>B :BufCurOnly<CR>

" gitgutter
nmap ]h <Plug>(GitGutterNextHunk) "same as default
nmap [h <Plug>(GitGutterPrevHunk) "same as default
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

" fugitive
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

" undotree
nnoremap <silent> <Leader>u :UndotreeToggle<CR>

" fold
nnoremap <space> za

" -----------------------------------------------------------------------------
" Autocmd
" -----------------------------------------------------------------------------

" cursorline
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" close all buffers except current one
command! BufCurOnly execute '%bdelete|edit#|bdelete#'

" AutoClose NERDTree when the last file is closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" python
augroup filetype_python
    autocmd!
    autocmd FileType python map <buffer> <F5> :w<CR>:cd %:p:h<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
    autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:cd %:p:h<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
augroup END

" yaml
augroup filetype_yaml
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" txt
augroup filetype_txt
    autocmd!
    autocmd FileType text setlocal ts=4 sts=4 sw=4 noexpandtab
augroup END
