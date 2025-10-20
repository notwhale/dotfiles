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

" general settings
syntax on
filetype plugin on
set nocompatible
set autoindent
set noswapfile
set hidden
set path+=**
set wildmenu
set title
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set showcmd
set showmode
set number
set relativenumber
set wrap
set ignorecase
set smartcase
set incsearch
set nohlsearch
set scrolloff=8
set encoding=utf-8
set mouse=a
set clipboard^=unnamed,unnamedplus
set complete+=kspell
set completeopt=menuone,longest
set splitbelow splitright
set laststatus=2
" set ruler
" set cursorline

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" adjust split size
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" terminal inside vim
map <leader>tt :vnew term://bash<CR>

" split windows from vertical to horizontal or vice versa
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" grep
set gp=git\ grep\ -n
" set grepprg=git\ --no-pager\ grep\ --no-color\ -n\ $*
" set grepformat=%f:%l:%m,%m\ %f\ match%ts,%f

" netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
" let g:netrw_list_hide=netrw_gitignore#Hide()
" execute 'set wildignore+='.substitute(g:netrw_list_hide.',**/.git/*','/,','/*,','g')

" folding
set foldenable
set foldlevelstart=20
set foldmethod=indent

" close unmodified buffers opened by netrw while `hidden` insn't set
autocmd fileType netrw setlocal bufhidden=delete

" yaml settings
autocmd fileType yaml setlocal ai et ts=2 sw=2 sts=2 indentkeys-=0#

" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
