local nvim_lsp = require('lspconfig')
local utils = require('lsp.utils')
local common_on_attach = utils.common_on_attach

-- add capabilities from nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable language servers with common settings
-- local servers = {"bashls", "clangd", "pyright", "jsonls", "dockerls"}
local servers = {"bashls", "pyright", "jsonls", "dockerls", "sumneko_lua", "vimls", "ansiblels", "html", "marksman", "terraformls", "yamlls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = common_on_attach,
    capabilities = capabilities,
  })
end

require('lsp.sumneko')

-- signature help hover
require "lsp_signature".setup({ })

