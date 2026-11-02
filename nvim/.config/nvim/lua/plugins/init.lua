vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = "https://github.com/tpope/vim-fugitive" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
})

require("plugins.treesitter")
-- require("plugins.lsp")
require("plugins.lualine")
require("plugins.fzf")
require("plugins.fugitive")
require("plugins.gitsigns")
require("plugins.mason")
require("plugins.gruvbox")
