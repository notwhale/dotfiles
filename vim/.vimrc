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
set shiftwidth=4
set softtabstop=4
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
set clipboard+=unnamed
set complete+=kspell
set completeopt=menuone,longest
set splitbelow splitright
set laststatus=2
" set ruler
" set cursorline

" grep
set gp=git\ grep\ -n
" set grepprg=git\ --no-pager\ grep\ --no-color\ -n\ $*
" set grepformat=%f:%l:%m,%m\ %f\ match%ts,%f

" netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
execute 'set wildignore+='.substitute(g:netrw_list_hide.',**/.git/*','/,','/*,','g')

" folding
set foldenable
set foldlevelstart=20
set foldmethod=indent

autocmd fileType netrw setlocal bufhidden=delete " close unmodified buffers opened by netrw while `hidden` insn't set
autocmd fileType yaml setlocal ai et nu ts=2 sw=2 sts=2 indentkeys-=0#

"remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

