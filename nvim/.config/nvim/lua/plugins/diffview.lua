require("diffview").setup({})

-- diff view, file history
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git: Diff View (all changes / merge conflicts)" })
vim.keymap.set("n", "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", { desc = "Git: Current File History" })
vim.keymap.set("n", "<leader>gl", "<cmd>DiffviewFileHistory<CR>", { desc = "Git: Repository History" })
vim.keymap.set("n", "<leader>gx", "<cmd>DiffviewClose<CR>", { desc = "Git: Close Diff View" })
