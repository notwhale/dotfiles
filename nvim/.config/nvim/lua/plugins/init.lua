vim.pack.add({
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/tpope/vim-fugitive" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/pearofducks/ansible-vim" },
  { src = "https://github.com/eyebrowkang/ansible-vault.nvim" },
})

require("plugins.gruvbox")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.fzf")
require("plugins.lualine")
require("plugins.fugitive")
require("plugins.gitsigns")
require("plugins.ansible")
require("plugins.ansible-vault")
