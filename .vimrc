if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set t_Co=256
colorscheme gruvbox
set background=dark
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let python_highlight_all = 1

set nocompatible
set lazyredraw
set ttyfast
set showcmd

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set foldcolumn=2

filetype plugin on
syntax on

set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
" clear out a search
nnoremap <leader><space> :noh<cr>
" reselect the text that was just pasted
nnoremap <leader>v V`]

if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

if has('mouse')
  set mouse=a
endif

"set mousehide
"set clipboard=unnamed
set ruler
set termencoding=utf-8
set noerrorbells
set novisualbell
"set t_vb=
"set visualbell t_vb=

set wrap
set linebreak
set number
set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf8,cp1251

"let mapleader = "\<Space>"
"strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"Replace all tabs with 4 whitespaces
nnoremap <leader>T :%s/\t/    /g<CR>

set pastetoggle=<F2>
noremap <F3> :set number!<CR>
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

nmap j gj
nmap k gk

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

nmap <C-m> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

vmap <leader>y :w! ~/.vim/.vbuf<CR>
nmap <leader>y :.w! ~/.vim/.vbuf<CR>
nmap <leader>p :r ~/.vim/.vbuf<CR>
