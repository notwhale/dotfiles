if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
call plug#end()

set t_Co=256
colorscheme gruvbox
set background=dark
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
"set number
set foldcolumn=2
filetype plugin on
syntax on

set noerrorbells
set novisualbell

let python_highlight_all = 1

" <search>
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
" clear out a search
nnoremap <leader><space> :noh<cr>
" reselect the text that was just pasted
nnoremap <leader>v V`]
" </search>

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

"strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Replace all tabs with 4 whitespaces
nnoremap <leader>T :%s/\t/    /g<CR>

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

nmap <F6> :NERDTreeToggle<CR>
noremap <F3> :set number!<CR>
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" Autopaste {
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"}
