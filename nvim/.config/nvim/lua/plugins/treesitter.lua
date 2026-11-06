-- nvim-treesitter (main branch): install parsers only; highlighting and
-- folding are native (:h treesitter-highlight). Needs tree-sitter-cli and a
-- C compiler (installed by nvim-deps, ~/.local/scripts).

local languages = {
  "bash",
  "lua",
  "luadoc",
  "luap",
  "query",
  "vim",
  "vimdoc",
  "markdown",
  "markdown_inline",
  "go",
  "groovy",
  "python",
  "rust",
  "c",
  "cpp",
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
  "jinja",
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
