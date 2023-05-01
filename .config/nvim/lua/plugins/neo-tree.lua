-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = false,
          hide_hidden = false, -- only works on Windows for hidden files/directories
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
            --"node_modules",
          },
          hide_by_pattern = {
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            ".gitignore",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            --".DS_Store",
            --"thumbs.db",
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
        },
        window = {
          mappings = {
            ["Y"] = function(state)
              -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
              -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
              local node = state.tree:get_node()
              local filepath = node:get_id()
              local filename = node.name
              local modify = vim.fn.fnamemodify

              local results = {
                filepath,
                modify(filepath, ":."),
                modify(filepath, ":~"),
                filename,
                modify(filename, ":r"),
                modify(filename, ":e"),
              }

              local messages = {
                "Choose to copy to clipboard:",
                "1. Absolute path: " .. results[1],
                "2. Path relative to CWD: " .. results[2],
                "3. Path relative to HOME: " .. results[3],
                "4. Filename: " .. results[4],
                "5. Filename without extension: " .. results[5],
                "6. Extension of the filename: " .. results[6],
              }
              vim.api.nvim_echo({ { table.concat(messages, "\n"), "Normal" } }, true, {})
              local i = vim.fn.getchar()

              if i >= 49 and i <= 54 then
                local result = results[i - 48]
                print(result)
                vim.fn.setreg("*", result)
              else
                print("Invalid choice: " .. string.char(i))
              end
            end,
          },
        },
      },
    })
  end,
}
