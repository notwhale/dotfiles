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
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Fzf: All Files" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Fzf: Buffers" })

-- grep
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Fzf: Live Grep" })
vim.keymap.set("v", "<leader>fg", "<cmd>FzfLua grep_visual<CR>", { desc = "Fzf: Grep Selection" })
vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<CR>", { desc = "Fzf: Grep Word under Cursor" })

-- git
vim.keymap.set("n", "<leader>gf", "<cmd>FzfLua git_files<CR>", { desc = "Fzf: Git Files" })
vim.keymap.set("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "Fzf: Git Status" })
vim.keymap.set("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Fzf: Git Commits" })
vim.keymap.set("n", "<leader>gb", "<cmd>FzfLua git_branches<CR>", { desc = "Fzf: Git Branches" })

-- lsp and diagnostics
vim.keymap.set("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", { desc = "Definitions" })
vim.keymap.set("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "References" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("x", "<leader>lf", vim.lsp.buf.format, { desc = "Format selection" })
vim.keymap.set("n", "<leader>fd", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Fzf: Document Diagnostics" })
vim.keymap.set("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Fzf: Document Symbols" })

vim.keymap.set("n", "<leader>?", "<cmd>FzfLua builtin<CR>", { desc = "Fzf: Help" })
