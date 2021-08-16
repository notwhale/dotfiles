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
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'davidhalter/jedi-vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'
call plug#end()

" -----------------------------------------------------------------------------
" Plugins settings
" -----------------------------------------------------------------------------

let python_highlight_all = 1

let mapleader=" "
let maplocalleader=" "

let g:SimpylFold_docstring_preview=1

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_skip_empty_sections = 1

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netew_browse_split = 2
"let g:netrw_altv = 1
"let g:netrw_winsize = 25

let NERDTreeIgnore=['\.pyc$', '^__pycache__$', '\~$']


"let g:jedi#use_splits_not_buffers = "winwidth"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#show_call_signatures = "1"

"let g:coc_global_extensions = [
    "\ 'coc-sh',
    "\ 'coc-markdownlint',
    "\ 'coc-vimlsp',
    "\ 'coc-json',
    "\ 'coc-pyright',
    "\ 'coc-yaml',
    "\ 'coc-yank',
    "\ 'coc-highlight',
    "\ 'coc-docker',
    "\ ]

"let g:ale_sign_column_always = 1
"let g:airline#extensions#ale#enabled = 1
"let g:ale_fix_on_save = 1
"let g:ale_linters = {
    "\ 'python': ['flake8', 'pylint'],
    "\ }
"let g:ale_fixers = {
    "\ 'python': ['yapf'],
    "\ }

" -----------------------------------------------------------------------------
" Core settings
" -----------------------------------------------------------------------------

filetype on
filetype plugin on
filetype indent on
syntax on

colorscheme gruvbox
set background=dark
set t_Co=256
set backspace=indent,eol,start
set formatoptions-=cro
"set completeopt-=preview
"set omnifunc=pythoncomplete
"set completeopt=menuone,menu,longest,preview
"set wildmenu
"set wildmode=list:longest
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf8,cp1251
set fileformats=unix,dos,mac
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldcolumn=2
set foldmethod=indent
set foldlevel=99
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

" window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" brackets
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>

" search and replace
nnoremap <Leader><Space> :let @/=''<CR>
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>T :%s/\t/    /g<CR>
"nnoremap <Leader>r :%s///g<Left><Left>
"nnoremap <Leader>rc :%s///gc<Left><Left><Left>
"xnoremap <Leader>r :s///g<Left><Left>
"xnoremap <Leader>rc :s///gc<Left><Left><Left>

" save and quit
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>W :w !sudo tee % > /dev/null
nnoremap <silent> <Leader>q <C-w>c
nnoremap <silent> <Leader>Q :q!<CR>
nnoremap Q <Nop>

" paste
nnoremap <silent> <F1> :set invpaste paste?<CR>

" nerdtree
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" Terminal
nnoremap <silent> <F4> :lcd %:p:h<CR>:belowright terminal<CR>
"nnoremap <silent> <F4> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

" fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>rg :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>gc :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" fugitive
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

" undotree
nnoremap <silent> <Leader>u :UndotreeToggle<CR>

" folding
"nnoremap <space> za

" -----------------------------------------------------------------------------
" Autocmd
" -----------------------------------------------------------------------------

" autochdir
"autocmd BufEnter * silent! lcd %:p:h

" folding
"augroup folding_save
    "autocmd!
    "autocmd BufWinLeave * mkview
    "autocmd BufWinEnter * silent loadview
"augroup END

" python
augroup filetype_python
    autocmd!
    "autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python map <buffer> <F5> :w<CR>:cd %:p:h<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
    autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:cd %:p:h<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
augroup END

"" -----------------------------------------------------------------------------
"" Plugin Settings
"" -----------------------------------------------------------------------------

"" ----------
"" CoC
"" ----------

"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved.
"if has("nvim-0.5.0") || has("patch-8.1.1564")
  "" Recently vim can merge signcolumn and number column into one
  "set signcolumn=number
"else
  "set signcolumn=yes
"endif

"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
"if has('nvim')
  "inoremap <silent><expr> <c-space> coc#refresh()
"else
  "inoremap <silent><expr> <c-@> coc#refresh()
"endif

"" Make <CR> auto-select the first completion item and notify coc.nvim to
"" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window.
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

"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
  "autocmd!
  "" Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder.
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
  "nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  "inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  "inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  "vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ----------
" ALE
" ----------

"nmap <F10> :ALEFix<CR>
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
