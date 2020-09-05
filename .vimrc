if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set t_Co=256
"colorscheme nord
colorscheme gruvbox
set background=dark
let g:airline_theme='base16_gruvbox_dark_hard'

set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"set autoindent
set number
set foldcolumn=2
filetype plugin on
syntax on

set noerrorbells
set novisualbell

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

nmap <F6> :NERDTreeToggle<CR>
noremap <F3> :set number!<CR>
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
