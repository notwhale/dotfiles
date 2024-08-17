return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        gopls = {},
        bashls = {},
        yamlls = {},
        helm_ls = {},
        dockerls = {},
        docker_compose_language_service = {},
        marksman = {},
        -- jsonnet_ls = {},
        -- terraformls = {},
        -- groovyls = {},
        lua_ls = {
          Lua = {
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
          },
        },
        ansiblels = {
          telemetry = { enable = false },
        },
      },
    },
  },
}
