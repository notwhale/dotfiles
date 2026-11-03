local fzf = require("fzf-lua")

fzf.setup({
	winopts = {
		height = 0.85,
		width = 0.85,
		fullscreen = false,
	},
	grep = {
		rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case -g '!.git'",
	},
})

-- files and buffers
vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua oldfiles<CR>", { desc = "Fzf: Recent Files" })
vim.keymap.set("n", "<leader>ff", function() fzf.files() end, { desc = "Fzf: All Files" })
vim.keymap.set("n", "<leader>fb", function() fzf.buffers() end, { desc = "Fzf: Buffers" })

-- grep
vim.keymap.set("n", "<leader>fg", function() fzf.live_grep() end, { desc = "Fzf: Live Grep" })
vim.keymap.set("v", "<leader>fg", function() fzf.grep_visual() end, { desc = "Fzf: Grep Selection" })
vim.keymap.set("n", "<leader>fw", function() fzf.grep_cword() end, { desc = "Fzf: Grep Word under Cursor" })

-- git
vim.keymap.set("n", "<leader>gf", function() fzf.git_files() end, { desc = "Fzf: Git Files" })
vim.keymap.set("n", "<leader>gs", function() fzf.git_status() end, { desc = "Fzf: Git Status" })
vim.keymap.set("n", "<leader>gc", function() fzf.git_commits() end, { desc = "Fzf: Git Commits" })
vim.keymap.set("n", "<leader>gb", function() fzf.git_branches() end, { desc = "Fzf: Git Branches" })

-- lsp and diagnostics
vim.keymap.set("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", { desc = "Definitions" })
vim.keymap.set("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "References" })
vim.keymap.set("n", "<leader>fd", function() fzf.diagnostics_document() end, { desc = "Fzf: Document Diagnostics" })
vim.keymap.set("n", "<leader>fs", function() fzf.lsp_document_symbols() end, { desc = "Fzf: Document Symbols" })

vim.keymap.set("n", "<leader>?", "<cmd>FzfLua builtin<CR>", { desc = "Fzf: Help" })
