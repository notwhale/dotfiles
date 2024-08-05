local util = require("lspconfig.util")
return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
        ansiblels = {
          telemetry = { enable = false },
          cmd = { "ansible-language-server", "--stdio" },
          settings = {
            ansible = {
              python = {
                interpreterPath = "python",
              },
              ansible = {
                path = "ansible",
              },
              executionEnvironment = {
                enabled = false,
              },
              validation = {
                enabled = true,
                lint = {
                  enabled = true,
                  path = "ansible-lint",
                },
              },
            },
          },
          filetypes = { "yaml.ansible" },
          root_dir = util.root_pattern("ansible.cfg", ".ansible-lint"),
          single_file_support = true,
        },
        bashls = {},
        dockerls = {},
        docker_compose_language_service = {},
        -- jsonnet_ls = {},
        marksman = {},
        yamlls = {},
        -- terraformls = {},
        helm_ls = {},
      },
    },
  },
}
