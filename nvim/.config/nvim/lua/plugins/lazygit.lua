-- kdheepak/lazygit.nvim — no lua setup(), commands only

-- full-screen float: factor 1.0 + hidden border
vim.g.lazygit_floating_window_scaling_factor = 1
vim.g.lazygit_floating_window_border_chars = 'none'

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit (Root Dir)" })
