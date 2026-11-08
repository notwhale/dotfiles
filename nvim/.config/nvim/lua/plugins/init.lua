vim.pack.add({
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/tpope/vim-fugitive" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/sindrets/diffview.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/kdheepak/lazygit.nvim" },
  { src = "https://github.com/tpope/vim-unimpaired" },
  -- -- markdown preview (in-buffer): disabled in favor of render-markdown.nvim
  -- { src = "https://github.com/OXY2DEV/markview.nvim" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/pearofducks/ansible-vim" },
  { src = "https://github.com/eyebrowkang/ansible-vault.nvim" },
})

require("plugins.gruvbox")
require("plugins.treesitter")
require("plugins.render-markdown")
require("plugins.typst-preview")
require("plugins.nvim-tree")
-- disabled in favor of render-markdown.nvim:
-- require("plugins.markview")
require("plugins.lsp")
require("plugins.fzf")
require("plugins.lualine")
require("plugins.fugitive")
require("plugins.gitsigns")
require("plugins.diffview")
require("plugins.lazygit")
require("plugins.ansible")
require("plugins.ansible-vault")
