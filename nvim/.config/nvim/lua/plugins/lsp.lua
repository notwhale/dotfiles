-- Native LSP (:h lsp-config). nvim-lspconfig is used only as a library of
-- lsp/*.lua defaults; overrides go through vim.lsp.config() below. Servers
-- are installed by nvim-deps (~/.local/scripts, on PATH). Default keys: K
-- grn gra grr gri.

-- lua_ls: the nvim config itself
vim.lsp.config("lua_ls", {
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = { vim.env.VIMRUNTIME },
        checkThirdParty = false,
      },
    },
  },
})

-- yamlls: schemastore + k8s schemas
vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemaStore = { enable = true },
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.33.2-standalone-strict/all.json"] = {
          "/*.k8s.yaml",
          "/*.k8s.yml",
          "/k8s/**/*.ya?ml",
        },
      },
    },
  },
})

-- ansiblels: works out of the box while ansible-lint 24+ is on PATH
-- (installed by nvim-deps); without it the server falls back to
-- `ansible --syntax-check`. ft "ansible" comes from ansible-vim's
-- ftdetect, "yaml.ansible" from config/filetypes.lua -- accept both.
vim.lsp.config("ansiblels", {
  filetypes = { "yaml.ansible", "ansible" },
  -- Uncomment the knobs below when the defaults stop fitting; the
  -- settings tree mirrors the VSCode extension.
  -- settings = {
  --  ansible = {
  --    python = { interpreterPath = ".venv/bin/python" },
  --    ansibleLint = {
  --      enabled = true,
  --      path = "ansible-lint",
  --      arguments = "-c .ansible-lint.yaml", -- custom lint config
  --    },
  --    completion = {
  --      provideRedirectModules = true,
  --      provideModuleOptions = true,
  --    },
  --  },
  -- },
})

-- gopls: built-in staticcheck
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      staticcheck = true,
    },
  },
})

-- jsonls: lspconfig's default cmd ("vscode-json-language-server") does not
-- match the bin name of the npm package ("vscode-json-languageserver")
vim.lsp.config("jsonls", {
  cmd = { "vscode-json-languageserver", "--stdio" },
})

-- tinymist: typst LSP (diagnostics, goto-def, symbols, formatting via typstyle).
-- Binaries tinymist/typst are on PATH (homebrew). Export-to-PDF on save needs
-- no extra keys; per-doc commands: :TinymistExportPdf? see lspconfig/tinymist.
vim.lsp.config("tinymist", {})

-- a server starts when the filetype matches and a root is found
vim.lsp.enable({
  "lua_ls",
  "bashls",
  "gopls",
  "basedpyright",
  "ruff",
  "yamlls",
  "ansiblels",
  "helm_ls", -- ft "helm" from config/filetypes.lua
  "jsonls",
  "tinymist",
})

-- native auto-completion (no plugin): snippets expand via vim.snippet,
-- select with CTRL-Y. completeopt is already "menuone,popup,noselect".
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

-- virtual_text is off by default in 0.12
vim.diagnostic.config({ virtual_text = true })
