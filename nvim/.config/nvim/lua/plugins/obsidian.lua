-- epwalsh/obsidian.nvim — Obsidian vault integration.
-- Vault: ~/Documents/Notes (the only vault in Obsidian config).
-- Requires plenary.nvim (already installed); picker: fzf-lua (installed).
-- Commands work only inside the vault directory (or with dir argument).
require("obsidian").setup({
  workspaces = {
    { name = "notes", path = "~/Documents/Notes" },
  },
  picker = {
    name = "fzf-lua",
  },
  -- note frontmatter / completion are defaults; keep config minimal
})

local map = function(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { desc = desc })
end

map("<leader>oo", "<cmd>ObsidianOpen<cr>", "Obsidian: open note in app")
map("<leader>on", "<cmd>ObsidianNew<cr>", "Obsidian: new note")
map("<leader>of", "<cmd>ObsidianQuickSwitch<cr>", "Obsidian: quick switch (fzf)")
map("<leader>os", "<cmd>ObsidianSearch<cr>", "Obsidian: search notes (rg)")
map("<leader>ot", "<cmd>ObsidianToday<cr>", "Obsidian: today's daily note")
map("<leader>oT", "<cmd>ObsidianTags<cr>", "Obsidian: list tags")
map("<leader>ob", "<cmd>ObsidianBacklinks<cr>", "Obsidian: backlinks")
map("<leader>ol", "<cmd>ObsidianLinks<cr>", "Obsidian: links in note")
