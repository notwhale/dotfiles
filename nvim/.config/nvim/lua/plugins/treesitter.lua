local languages = {
	"bash",
	"c",
	"cmake",
	"cpp",
	"diff",
	"dockerfile",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"go",
	"groovy",
	"html",
	"json",
	"lua",
	"luadoc",
	"luap",
	"make",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"rust",
	"sql",
	"tmux",
	"toml",
	"vim",
	"vimdoc",
	"yaml",
}

local install = require('nvim-treesitter.install')
install.parser_install_dir = vim.fn.stdpath('data') .. '/site/parser'
install.prefer_git = true
install.compilers = { 'gcc', 'clang' }

require('nvim-treesitter.configs').setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
  auto_install = true,
  ensure_installed = languages
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

