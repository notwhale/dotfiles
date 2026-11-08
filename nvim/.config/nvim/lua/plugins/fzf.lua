local fzf = require("fzf-lua")
local actions = fzf.actions

-- LazyVim-style setup: "default-title" profile (+tweaks merged over it).
-- NOTE: profile name and options must be ONE table: setup({ "profile", <opts> })
fzf.setup({
  "default-title",
  fzf_colors = true, -- colors follow the colorscheme (gruvbox)
  fzf_opts = {
    ["--no-scrollbar"] = true,
  },
  defaults = {
    formatter = "path.dirname_first",
  },
  winopts = {
    width = 1,
    height = 1,
    row = 0.5,
    col = 0.5,
    preview = {
      scrollchars = { "┃", "" },
    },
  },
  files = {
    cwd_prompt = false,
    actions = {
      ["alt-i"] = { actions.toggle_ignore },
      ["alt-h"] = { actions.toggle_hidden },
    },
  },
  grep = {
    actions = {
      ["alt-i"] = { actions.toggle_ignore },
      ["alt-h"] = { actions.toggle_hidden },
    },
  },
  keymap = {
    fzf = {
      -- quickfix: select-all + accept
      ["ctrl-q"] = "select-all+accept",
      ["ctrl-u"] = "half-page-up",
      ["ctrl-d"] = "half-page-down",
      ["ctrl-x"] = "jump",
      -- preview scroll
      ["ctrl-f"] = "preview-page-down",
      ["ctrl-b"] = "preview-page-up",
    },
    builtin = {
      ["<c-f>"] = "preview-page-down",
      ["<c-b>"] = "preview-page-up",
    },
  },
  -- -- trouble.nvim integration (if ever added):
  -- -- config.defaults.actions.files["ctrl-t"] = require("trouble.sources.fzf").actions.open
  -- -- toggle root dir / cwd (LazyVim.pick-based)
  -- -- config.defaults.actions.files["ctrl-r"] = <toggle root action>
})

-- vim.ui.select (LSP code actions, etc.) goes through fzf-lua
fzf.register_ui_select(function(fzf_opts, items)
  return vim.tbl_deep_extend("force", fzf_opts, {
    prompt = "> ",
    winopts = {
      title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
      title_pos = "center",
    },
  })
end)

-- find (<leader>f)
vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua oldfiles<CR>", { desc = "Fzf: Recent Files" })
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Fzf: All Files" })
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<CR>", { desc = "Fzf: Recent Files" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Fzf: Buffers" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua git_files<CR>", { desc = "Fzf: Git Files" })

-- search (<leader>s)
vim.keymap.set("n", "<leader>sg", "<cmd>FzfLua live_grep<CR>", { desc = "Fzf: Live Grep" })
vim.keymap.set("v", "<leader>sg", "<cmd>FzfLua grep_visual<CR>", { desc = "Fzf: Grep Selection" })
vim.keymap.set("n", "<leader>sw", "<cmd>FzfLua grep_cword<CR>", { desc = "Fzf: Grep Word under Cursor" })
vim.keymap.set("x", "<leader>sw", "<cmd>FzfLua grep_visual<CR>", { desc = "Fzf: Grep Selection" })
vim.keymap.set("n", "<leader>sd", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Fzf: Document Diagnostics" })
vim.keymap.set("n", "<leader>sq", "<cmd>FzfLua quickfix<CR>", { desc = "Fzf: Quickfix List" })
vim.keymap.set("n", "<leader>sk", "<cmd>FzfLua keymaps<CR>", { desc = "Fzf: Search Keymaps" })

-- git (<leader>g)
vim.keymap.set("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "Fzf: Git Status" })
vim.keymap.set("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Fzf: Git Commits" })
vim.keymap.set("n", "<leader>gb", "<cmd>FzfLua git_branches<CR>", { desc = "Fzf: Git Branches" })
vim.keymap.set("n", "<leader>gS", "<cmd>FzfLua git_stash<CR>", { desc = "Fzf: Git Stash" })

-- lsp and diagnostics
vim.keymap.set("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", { desc = "Definitions" })
vim.keymap.set("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "References" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("x", "<leader>lf", vim.lsp.buf.format, { desc = "Format selection" })
vim.keymap.set("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Fzf: Document Symbols" })

vim.keymap.set("n", "<leader>?", "<cmd>FzfLua builtin<CR>", { desc = "Fzf: Help" })
