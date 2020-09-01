call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'morhetz/gruvbox'
call plug#end()

filetype plugin indent on

syntax on
set t_Co=256
colorscheme gruvbox
set background=dark

"set number
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent

let python_highlight_all = 1

set hlsearch
set incsearch

set mouse=a
set mousehide
set clipboard=unnamed
set ruler
set termencoding=utf-8
set novisualbell
set t_vb=
set visualbell t_vb=

set wrap
set linebreak

set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf8,cp1251

map <C-n> :NERDTreeToggle<CR>
noremap <F3> :set number!<CR>
