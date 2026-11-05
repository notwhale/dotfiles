" You might have to force true color when using regular vim inside tmux as the
" colorscheme can appear to be grayscale with "termguicolors" option enabled.
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" colors
set termguicolors
set background=dark
colorscheme gruvbox

" leader
let mapleader = " "
let maplocalleader = " "

" general settings
syntax on
filetype plugin on
set nocompatible
set noswapfile
set hidden
set path+=**
set wildmenu
set title
set showcmd
set showmode
set number
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
" set smartindent
set nowrap
set nohlsearch
set incsearch
set ignorecase
set smartcase
set complete+=kspell
set completeopt=menuone,longest
set splitbelow
set splitright
set encoding=utf-8
set laststatus=2
set scrolloff=8
set ruler
set cursorline
set mouse=a
set clipboard^=unnamed,unnamedplus

" keymap
" set keymap=russian-jcukenwin
" set iminsert=0
" set imsearch=0
" highlight lCursor guifg=NONE guibg=Cyan
" inoremap <C-l> <C-^>

" netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_localrmdir = 'rm -r'
let g:netrw_list_hide2 = '\(^\|\s\s\)\zs\.\S\+'
hi! link netrwMarkFile Search
nnoremap <leader>e :Lexplore<CR>
nnoremap <leader>f :Lexplore %:p:h<CR>

" adjust split size
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" split windows from vertical to horizontal or vice versa
nnoremap <leader>th <C-w>t<C-w>H
nnoremap <leader>tk <C-w>t<C-w>K

" grep
" set gp=git\ grep\ -n
" set grepprg=git\ grep\ --no-pager\ --no-color\ -n\ $*
" set grepformat=%f:%l:%m,%m\ %f\ match%ts,%f

nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprev<CR>

nnoremap <leader>r :%s/<C-r><C-w>/

" folding
"set foldenable
"set foldlevelstart=20
"set foldmethod=indent

" close unmodified buffers opened by netrw while `hidden` insn't set
autocmd fileType netrw setlocal bufhidden=delete

" yaml settings
autocmd fileType yaml setlocal ai et ts=2 sw=2 sts=2 indentkeys-=0#

" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
