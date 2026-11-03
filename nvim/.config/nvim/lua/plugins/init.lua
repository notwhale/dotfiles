-- Nvim 0.12 vim.pack; update with :vim.pack.update()
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
})

require("plugins.gruvbox") -- before lualine
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.fzf")
require("plugins.fugitive")
require("plugins.gitsigns")
