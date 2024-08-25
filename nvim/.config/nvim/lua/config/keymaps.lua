-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- -- Leader key
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '
--
-- -- Move around windows
-- vim.keymap.set('n', '<C-h>', '<C-w>h')
-- vim.keymap.set('n', '<C-j>', '<C-w>j')
-- vim.keymap.set('n', '<C-k>', '<C-w>k')
-- vim.keymap.set('n', '<C-l>', '<C-w>l')
--
-- -- Clear highlight search
-- vim.keymap.set({ 'n', 'v' }, '<leader>h', ':nohlsearch<CR>')
--
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
--
-- -- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--
-- -- Relect selected when indenting
-- vim.keymap.set('v', '<', '<gv')
-- vim.keymap.set('v', '>', '>gv')
--
-- -- Add empty line
-- vim.keymap.set('n', '<leader>o', 'o<Esc>')
-- vim.keymap.set('n', '<leader>O', 'O<Esc>')
--
-- Copypaste
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete to null buffer" })
vim.keymap.set("n", "<leader>Y", "y$", { desc = "Yank to end of line" })
vim.keymap.set("n", "<leader>y", "yg_", { desc = "Yank line without line break" })
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { desc = "Yank all" })
vim.keymap.set("v", "<leader>p", '"_dp', { desc = "Paste over currently selected text after without yanking it" })
vim.keymap.set("v", "<leader>P", '"_dP', { desc = "Paste over currently selected text before without yanking it" })

-- Remap language mapping keystroke
vim.keymap.set("i", "<c-l>", "<c-^>", { silent = false })

-- Lsp
vim.keymap.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })
