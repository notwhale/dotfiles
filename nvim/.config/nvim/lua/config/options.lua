-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- -- -- options
-- -- vim.o.backspace        = '2'
-- -- vim.o.showcmd          = true
-- -- vim.o.laststatus       = 2
-- -- vim.o.autowrite        = true
-- -- vim.o.autoread         = true
--
-- -- Clipboard
-- vim.o.clipboard       = "unnamedplus"
--
-- -- Visual
-- -- vim.o.conceallevel     = 0 -- Don't hide quotes in markdown
-- -- vim.o.cmdheight        = 1
-- -- vim.o.pumheight        = 10
-- -- vim.o.showmode         = false
-- -- -- vim.o.showtabline      = 2      -- Always show tabline
-- -- -- vim.o.title            = true
-- vim.o.termguicolors   = true -- Use true colors, required for some plugins
-- vim.wo.number         = true
-- vim.wo.relativenumber = true
-- vim.wo.signcolumn     = 'yes'
-- vim.wo.cursorline     = true
--
-- vim.o.textwidth       = 80
-- vim.wo.colorcolumn    = '+1'
-- vim.wo.wrap           = true
-- vim.o.foldcolumn      = 'auto'
--
-- -- Behaviour
-- vim.o.hlsearch        = false
-- vim.o.ignorecase      = true -- Ignore case when using lowercase in search
-- vim.o.smartcase       = true -- But don't ignore it when using upper case
-- -- vim.o.smarttab        = true
-- -- vim.o.smartindent     = true
-- vim.o.breakindent     = true
-- vim.o.autoindent      = true
-- vim.o.expandtab       = true -- Convert tabs to spaces.
-- vim.o.tabstop         = 2
-- vim.o.softtabstop     = 2
-- vim.o.shiftwidth      = 2
-- vim.o.splitbelow      = true
-- vim.o.splitright      = true
-- -- vim.o.scrolloff        = 12 -- Minimum offset in lines to screen borders
-- -- vim.o.sidescrolloff    = 8
-- vim.o.mouse           = 'a'
-- vim.o.shiftround      = true
-- vim.o.undofile        = true
--
-- -- Vim specific
-- -- vim.o.hidden           = true -- Do not save when switching buffers
-- vim.o.fileencoding    = "utf-8"
-- -- vim.o.spell            = false
-- -- vim.o.spelllang        = "en_us"
-- vim.o.completeopt     = "menuone,noinsert,noselect"
-- -- vim.o.wildmode         = "longest,full" -- Display auto-complete in Command Mode
-- vim.o.updatetime      = 300 -- Delay until write to Swap and HoldCommand event
-- vim.o.timeout         = true
-- vim.o.timeoutlen      = 300
-- -- vim.g.do_file_type_lua = 1

-- Keymap
vim.o.keymap = "russian-jcukenwin"
vim.o.iminsert = 0
vim.o.imsearch = 0

-- Fold
vim.o.spell = false
vim.o.foldmethod = "manual"
vim.o.foldenable = false

-- Scrolling
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8

-- Markdown
vim.g.mkdp_browser = "/Applications/Firefox.app/Contents/MacOS/firefox"

-- Prettier
vim.g.lazyvim_prettier_needs_config = true

-- Autoformat
vim.g.autoformat = false
