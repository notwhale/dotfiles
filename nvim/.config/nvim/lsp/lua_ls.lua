-- LSP configuration for the Lua language server.
--
-- Neovim 0.11+ uses `vim.lsp.enable()` which automatically picks up files
-- inside the `lsp/` folder. This file is returned as a Lua table and Neovim
-- passes it straight to the LSP client.
--
-- Requirements: lua-language-server must be on your $PATH.

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      -- Neovim embeds LuaJIT, not vanilla Lua 5.1.
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        -- Teach the server about Neovim's Lua API so it knows about `vim.*`.
        library = { vim.env.VIMRUNTIME },
        -- Don't prompt about third-party libraries.
        checkThirdParty = false,
      },
    },
  },
}

-- ~/.config/nvim-new/lsp/lua_ls.lua
-- ---@type vim.lsp.Config
-- return {
--     cmd = { 'lua-language-server' },
--     filetypes = { 'lua' },
--     root_markers = {
--         '.luarc.json',
--         '.luarc.jsonc',
--         '.luacheckrc',
--         '.stylua.toml',
--         'stylua.toml',
--         'selene.toml',
--         'selene.yml',
--         '.git',
--     },
--     settings = {
--         Lua = {
--             runtime = {
--                 version = "Lua 5.4",
--             },
--             completion = {
--                 enable = true,
--             },
--             diagnostics = {
--                 enable = true,
--                 globals = { "vim" },
--             },
--             workspace = {
--                 library = { vim.env.VIMRUNTIME },
--                 checkThirdParty = false,
--             },
--         },
--     },
-- }
--
