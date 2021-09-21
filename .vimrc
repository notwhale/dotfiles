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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

let g:coc_global_extensions = [
    \ 'coc-sh',
    \ 'coc-markdownlint',
    \ 'coc-vimlsp',
    \ 'coc-json',
    \ 'coc-pyright',
    \ 'coc-yaml',
    \ 'coc-yank',
    \ 'coc-highlight',
    \ 'coc-docker',
    \ ]

let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 0
let g:ale_lsp_suggestions = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 0
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_insert_leave = 1
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1
let g:ale_linters = {
    \ 'yaml': ['yamllint'],
    \ }
let g:ale_linters = {
    \ 'python': ['flake8', 'pylint'],
    \ }
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'python': ['isort', 'yapf', 'black'],
    \ }

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

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
"set formatoptions-=cro
"set completeopt-=preview
"set omnifunc=pythoncomplete
"set completeopt=menuone,menu,longest,preview
"set completeopt=menu,menuone,preview,noselect,noinsert
"set wildmenu
"set wildmode=list:longest
set encoding=utf-8
set termencoding=utf-8
"set fileencoding=utf-8
set fileencodings=utf8,cp1251
set fileformats=unix,dos,mac
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldcolumn=2
"set foldmethod=indent
"set foldlevel=99
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
set cmdheight=2
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
"set cursorline
set mouse=a
set clipboard=unnamed,unnamedplus
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

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
nnoremap <Leader><Space> :let @/=''<CR>
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
"nnoremap <silent> <F4> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

" search and replace
nnoremap <F4> :%s///gc<left><left><left><left>
nnoremap cn *``cgn
nnoremap cN *``cgN

" ALE
nmap <F10> :ALEFix<CR>

" fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>F :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
"nnoremap <silent> <Leader>/ :BLines<CR>
"nnoremap <silent> <Leader>' :Marks<CR>
"nnoremap <silent> <Leader>gc :Commits<CR>
"nnoremap <silent> <Leader>H :Helptags<CR>
"nnoremap <silent> <Leader>hh :History<CR>
"nnoremap <silent> <Leader>h: :History:<CR>
"nnoremap <silent> <Leader>h/ :History/<CR>

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


"nnoremap <space> za

" -----------------------------------------------------------------------------
" Autocmd
" -----------------------------------------------------------------------------

" autochdir
"autocmd BufEnter * silent! lcd %:p:h

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
    autocmd FileType text setlocal ts=4 sw=4 sts=0 noexpandtab
augroup END

"" -----------------------------------------------------------------------------
"" Plugin Settings
"" -----------------------------------------------------------------------------

"" ----------
"" CoC
"" ----------

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("nvim-0.5.0") || has("patch-8.1.1564")
  "" Recently vim can merge signcolumn and number column into one
  "set signcolumn=number
"else
  "set signcolumn=yes
"endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
      "let col = col('.') - 1
        "return !col || getline('.')[col - 1]  =~# '\s'
    "endfunction

" Use <c-space> to trigger completion.
"if has('nvim')
  "inoremap <silent><expr> <c-space> coc#refresh()
"else
  "inoremap <silent><expr> <c-@> coc#refresh()
"endif

" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)

" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "elseif (coc#rpc#ready())
    "call CocActionAsync('doHover')
  "else
    "execute '!' . &keywordprg . " " . expand('<cword>')
  "endif
"endfunction

" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

" ----------
" ALE
" ----------

"function! LinterStatus() abort
  "let l:counts = ale#statusline#Count(bufnr(''))

  "let l:all_errors = l:counts.error + l:counts.style_error
  "let l:all_non_errors = l:counts.total - l:all_errors

  "return l:counts.total == 0 ? '✨ all good ✨' : printf(
        "\   '😞 %dW %dE',
        "\   all_non_errors,
        "\   all_errors
        "\)
"endfunction

"set statusline=
"set statusline+=%m
"set statusline+=\ %f
"set statusline+=%=
"set statusline+=\ %{LinterStatus()}
