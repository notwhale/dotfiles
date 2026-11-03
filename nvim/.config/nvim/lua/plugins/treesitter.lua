-- nvim-treesitter (main branch): install parsers only; highlighting and
-- folding are native (:h treesitter-highlight). Needs tree-sitter-cli and a
-- C compiler (scripts/bootstrap.sh).

local languages = {
	-- nvim itself
	"bash",
	"lua",
	"luadoc",
	"luap",
	"query",
	"vim",
	"vimdoc",
	"markdown",
	"markdown_inline",
	-- languages
	"go",
	"groovy",
	"python",
	"rust",
	"c",
	"cpp",
	-- config and data
	"cmake",
	"diff",
	"dockerfile",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"html",
	"json",
	"make",
	"regex",
	"sql",
	"toml",
	"yaml",
	-- k8s / helm
	"helm",
}

-- install missing parsers (no-op when up to date)
require("nvim-treesitter").install(languages)

-- start native highlight where a parser exists
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})
