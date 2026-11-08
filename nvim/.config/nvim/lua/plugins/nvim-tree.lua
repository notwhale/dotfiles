-- nvim-tree.lua — file explorer.
-- side = "right": tree column on the right;
-- preserve_window_proportions = true: editor windows keep their size when the
-- tree opens/closes, so code does not shift.
require("nvim-tree").setup({
  view = {
    side = "right",
    width = 32,
    preserve_window_proportions = true,
  },
  renderer = {
    icons = { show = { git = true, folder = true, file = true } },
    highlight_git = "name",
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer: Toggle (right)" })
vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFocus<cr>", { desc = "Explorer: Focus tree" })
