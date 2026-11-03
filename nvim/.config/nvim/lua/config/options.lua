-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Providers healthcheck
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_altfile = 1

-- options
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.showtabline = 2
vim.o.breakindent = true
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.cursorline = true
vim.o.signcolumn = "yes:1"
-- no global textwidth: with the default formatoptions it hard-wraps while typing
vim.o.wrap = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.autoread = true
vim.o.laststatus = 3
vim.o.cmdheight = 0
vim.o.winborder = "rounded"
vim.o.mouse = 'a'
vim.o.scrolloff = 8
vim.o.showmode = false
vim.o.confirm = true
vim.o.list = true
vim.opt.listchars = { tab = '>> ', trail = '.', nbsp = ' ' }
vim.schedule(function()
  vim.opt.clipboard:append "unnamedplus"
end)

vim.o.completeopt = "menuone,popup,noselect"
vim.o.wildmode = "longest,full"
vim.o.wildoptions = "pum,fuzzy,tagfile"

vim.o.updatetime = 100

vim.o.grepprg = "rg --vimgrep --smart-case --hidden -g '!.git'"
vim.o.grepformat = "%f:%l:%c:%m"

-- russian keymap
vim.o.keymap = "russian-jcukenwin"
vim.o.iminsert = 0
vim.o.imsearch = 0
