require("fzf-lua").setup({
  winopts = {
    height = 0.85,
    width = 0.85,
    fullscreen = false,
  },
  grep = {
    rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case -g '!.git'",
  },
})

vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua oldfiles<CR>", { desc = "Fzf: Recent Files" })
vim.keymap.set("n", "<leader>ff", function() FzfLua.files() end, { desc = "Fzf: All Files" })
vim.keymap.set("n", "<leader>fb", function() FzfLua.buffers() end, { desc = "Fzf: Buffers" })

vim.keymap.set("n", "<leader>fg", function() FzfLua.live_grep() end, { desc = "Fzf: Live Grep" })
vim.keymap.set("v", "<leader>fg", function() FzfLua.grep_visual() end, { desc = "Fzf: Grep Selection" })
vim.keymap.set("n", "<leader>fw", function() FzfLua.grep_cword() end, { desc = "Fzf: Grep Word under Cursor" })

vim.keymap.set("n", "<leader>gf", function() FzfLua.git_files() end, { desc = "Fzf: Git Files" })
vim.keymap.set("n", "<leader>gs", function() FzfLua.git_status() end, { desc = "Fzf: Git Status" })
vim.keymap.set("n", "<leader>gc", function() FzfLua.git_commits() end, { desc = "Fzf: Git Commits" })
vim.keymap.set("n", "<leader>gb", function() FzfLua.git_branches() end, { desc = "Fzf: Git Branches" })

vim.keymap.set("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", { desc = "Definitions" })
vim.keymap.set("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "References" })
vim.keymap.set("n", "<leader>fd", function() FzfLua.diagnostics_document() end, { desc = "Fzf: Document Diagnostics" })
vim.keymap.set("n", "<leader>fs", function() FzfLua.lsp_document_symbols() end, { desc = "Fzf: Document Symbols" })

vim.keymap.set("n", "<leader>?", "<cmd>FzfLua builtin<CR>", { desc = "Fzf: Help" })

-- require("fzf-lua").setup({
--   winopts = {
--     height = 0.85,
--     width = 0.85,
--     fullscreen = false,
--   },
--   grep = {
--     rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case -g '!.git'",
--   },
-- })
--
-- -- Files & buffers
-- vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find files" })
-- vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<CR>", { desc = "Recent files" })
-- vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })
-- vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<CR>", { desc = "Help tags" })
-- vim.keymap.set("n", "<leader>fm", "<cmd>FzfLua marks<CR>", { desc = "Marks" })
--
-- -- Search in file contents
-- vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Grep" })
-- vim.keymap.set("v", "<leader>fg", "<cmd>FzfLua grep_visual<CR>", { desc = "Grep selection" })
-- vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<CR>", { desc = "Grep word under cursor" })
--
-- -- LSP pickers
-- vim.keymap.set("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Document symbols" })
-- vim.keymap.set("n", "<leader>lt", "<cmd>FzfLua lsp_typedefs<CR>", { desc = "Type definitions" })
