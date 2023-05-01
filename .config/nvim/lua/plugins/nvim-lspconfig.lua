return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
        ansiblels = {
          telemetry = { enable = false },
        },
        bashls = {},
        dockerls = {},
        docker_compose_language_service = {},
        jsonnet_ls = {},
        marksman = {},
        pyright = {},
        -- terraformls = {},
        yamlls = {},
      },
    },
  },
}
