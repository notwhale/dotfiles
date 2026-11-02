-- -- Leader key
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- -- Move around windows
-- vim.keymap.set('n', '<C-h>', '<C-w>h')
-- vim.keymap.set('n', '<C-j>', '<C-w>j')
-- vim.keymap.set('n', '<C-k>', '<C-w>k')
-- vim.keymap.set('n', '<C-l>', '<C-w>l')

-- -- Clear highlight search
-- vim.keymap.set({ 'n', 'v' }, '<leader>h', ':nohlsearch<CR>')

-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- -- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- -- Relect selected when indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move line
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move current line down" })
-- vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move current line up" })

vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Copypaste
-- vim.keymap.set("n", "<leader>Y", "y$", { desc = "Yank to end of line" })
-- vim.keymap.set("n", "<leader>y", "yg_", { desc = "Yank line without line break" })
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { desc = "Yank all" })
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Paste over currently selected text after without yanking it" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete to null buffer" })

-- Replace
vim.keymap.set("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>', { desc = "Replace all instances of highlighted words" })
vim.keymap.set("v", "<C-s>", ":sort<CR>", { desc = "Sort highlighted text in visual mode with Control+S" })

-- Scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Lsp
-- vim.keymap.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })
-- vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format" })

-- Keymap
vim.keymap.set("i", "<c-l>", "<c-^>", { silent = false })
