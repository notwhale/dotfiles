require("ansible-vault").setup({
  password_files = ".vault_pass",
})

vim.keymap.set("n", "<leader>vc", ":VaultCreate<cr>", { desc = "vault: create vault" })
vim.keymap.set("n", "<leader>vv", ":VaultView<cr>", { desc = "vault: view vault value" })
vim.keymap.set("n", "<leader>ve", ":VaultEdit<cr>", { desc = "vault: edit secret" })
vim.keymap.set("n", "<leader>vr", ":VaultRekey<cr>", { desc = "vault: rekey" })
vim.keymap.set("n", "<leader>vx", ":VaultDecrypt<cr>", { desc = "vault: decrypt file or value" })
vim.keymap.set("n", "<leader>vX", ":VaultEncrypt<cr>", { desc = "vault: encrypt file" })
vim.keymap.set("x", "<leader>vX", ":VaultEncrypt<cr>", { desc = "vault: encrypt selection" })
