-- Native LSP (:h lsp-config). nvim-lspconfig is used only as a library of
-- lsp/*.lua defaults; overrides go through vim.lsp.config() below. Servers
-- are installed by scripts/bootstrap.sh. Default keys: K grn gra grr gri.

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

-- gopls: built-in staticcheck
vim.lsp.config("gopls", {
	settings = {
		gopls = {
			staticcheck = true,
		},
	},
})

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
})

-- virtual_text is off by default in 0.12
vim.diagnostic.config({ virtual_text = true })
