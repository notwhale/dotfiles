if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
    "let g:airline_theme='base16_gruvbox_dark_dark'
    let g:airline_powerline_fonts=1
"    let g:airline#extensions#branch#enabled = 1
"    let g:airline#extensions#ale#enabled = 1
"    let g:airline#extensions#tabline#enabled = 1
"    let g:airline#extensions#tagbar#enabled = 1
"    let g:airline#extensions#virtualenv#enabled = 1
"    let g:airline_skip_empty_sections = 1

Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'SidOfc/mkdx'
Plug 'plasticboy/vim-markdown'
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_conceal = 2
    let g:vim_markdown_conceal_code_blocks = 0
    let g:vim_markdown_math = 1
    let g:vim_markdown_toml_frontmatter = 1
    let g:vim_markdown_frontmatter = 1
    let g:vim_markdown_strikethrough = 1
    let g:vim_markdown_autowrite = 1
    let g:vim_markdown_edit_url_in = 'tab'
    let g:vim_markdown_follow_anchor = 1

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
set lazyredraw
set showcmd
set wrap
set linebreak
set nobackup
set noswapfile
set nocompatible
set noerrorbells
set novisualbell

set ruler
set number relativenumber

set splitbelow splitright

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

syntax on
filetype plugin indent on

set mouse=a
set clipboard=unnamed,unnamedplus

set t_Co=256
colorscheme gruvbox
set background=dark

let python_highlight_all = 1

let mapleader=","
let maplocalleader="\\"

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netew_browse_split = 4
let g:netrw_altv = 1
"let g:netrw_winsize = 25
nnoremap <silent> <Leader>n :Explore<CR>
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END

" ripgrep instead grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>ff :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" greatest remap ever
vnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" some remap
set pastetoggle=<F2>
noremap <F3> :set number!<CR>
nnoremap <F4> :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>

" undotree
nnoremap <silent> <Leader>u :UndotreeToggle<CR>

nnoremap <silent> <leader><space> :noh<cr>
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>T :%s/\t/    /g<CR>

"command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
"cmap w!! w !sudo tee > /dev/null %

noremap <silent> <Leader>w :w<CR>
noremap <silent> <Leader>ww :w !sudo tee % > /dev/null

nmap j gj
nmap k gk

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> <leader>nt :NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>

"nmap <C-s> <Plug>MarkdownPreview
"nmap <M-s> <Plug>MarkdownPreviewStop
"nmap <C-p> <Plug>MarkdownPreviewToggle

"nnoremap <C-g> :Goyo<CR>

" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" python
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>

" execute code
"augroup exe_code
    "autocmd!
    "" bash
    "autocmd FileType bash,sh nnoremap <buffer> <localleader>r :sp<CR> :term bash %<CR> :startinsert<CR>
    "" python
    "autocmd FileType python nnoremap <buffer> <localleader>r :sp<CR>!python3 %<CR> :startinsert<CR>
"augroup END

" markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
"autocmd FileType markdown Goyo

" autocmd FileType markdown setlocal textwidth=100
autocmd FileType markdown set cursorline
" autocmd FileType markdown set nocursorline
" autocmd FileType markdown set nocursorcolumn
" autocmd FileType markdown set linebreak
autocmd FileType markdown set expandtab
autocmd FileType markdown set tabstop=2
autocmd FileType markdown set shiftwidth=2
autocmd FileType markdown set scrolloff=12
autocmd FileType markdown let b:surround_{char2nr("~")} = "```\r```"
autocmd FileType markdown let b:surround_{char2nr("_")} = "*\r*"
autocmd FileType markdown let b:surround_{char2nr("*")} = "**\r**"
autocmd FileType markdown let b:surround_{char2nr(">")} = "> \r"
