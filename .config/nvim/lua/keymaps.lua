
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- nvim-tree toggle
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- Clear highlight search
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('v', '<leader>h', ':nohlsearch<CR>')

-- Yank to end of line
vim.keymap.set('n', 'Y', 'y$')
-- vim.keymap.set('n', 'Y', 'yg_')
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'X', '"_x')

-- Copy to system clippboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')

-- Paste from system clippboard
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')

-- Useful keymaps
vim.keymap.set('n', '<leader>p', '"_dP')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', 'gg"+yG')
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- Move around windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Telescope
vim.keymap.set('n', '<leader>ff', '<Cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fhf','<Cmd>Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>')
