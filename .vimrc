if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'scrooloose/nerdcommenter'
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"let g:coc_global_extensions = [
      "\ 'coc-markdownlint',
      "\ 'coc-lists',
      "\ 'coc-sh',
      "\ 'coc-vimlsp',
      "\ 'coc-json',
      "\ 'coc-python',
      "\ 'coc-yaml',
      "\ 'coc-yank',
      "\ 'coc-highlight',
      "\ 'coc-snippets',
      "\ 'coc-docker',
      "\]
call plug#end()

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf8,cp1251
set fileformats=unix,dos,mac

set backspace=indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldcolumn=2
set expandtab
set smarttab
set autoindent

set hidden

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set ttyfast
"set lazyredraw
set showcmd
set wrap
set linebreak
set nobackup
set noswapfile
set nocompatible
set noerrorbells
set novisualbell

set ruler
set number

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set mouse=a
set clipboard=unnamed,unnamedplus

syntax on
filetype plugin indent on

set t_Co=256
colorscheme gruvbox
set background=dark

let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_skip_empty_sections = 1

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree"

let python_highlight_all = 1

let mapleader=','

set pastetoggle=<F2>
noremap <F3> :set number!<CR>
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

nnoremap <silent> <leader><space> :noh<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>T :%s/\t/    /g<CR>

nmap j gj
nmap k gk

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

nmap <silent> <leader>m :NERDTreeFind<CR>
nmap <silent> <leader>n :NERDTreeToggle<CR>

vmap <leader>y :w! ~/.vim/.vbuf<CR>
nmap <leader>y :.w! ~/.vim/.vbuf<CR>
nmap <leader>p :r ~/.vim/.vbuf<CR>

" Markdown preview
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

autocmd FileType python map <buffer> <F5> :w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
