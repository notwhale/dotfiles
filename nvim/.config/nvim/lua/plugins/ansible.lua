-- ansible-vim: syntax layer (Jinja2 in YAML + *.j2 templates); the
-- semantic layer (completion, diagnostics, hover) stays on ansiblels.
-- setup() registers the "ansible" tree-sitter language (jinja parser,
-- YAML injected between {{ }}/{% %}/{# #}) and appends Ansible keyword
-- groups to the yaml highlights query. That extension is global for the
-- session: keys like name/when/vars light up in any yaml buffer, k8s
-- manifests included.
vim.g.ansible_ftdetect_filename_regex = "$^" -- never matches
require("ansible").setup()

-- The plugin's ftdetect claims ft "ansible" for anything under
-- tasks/roles/handlers, group_vars/host_vars, and ansible-playbook
-- shebangs -- that is accepted as is (ansiblels matches it via
-- plugins/lsp.lua). Only the filename part is disabled via the regex
-- above: it would steal any unrelated main.yml/site.yml/requirements.yml;
-- root-level entrypoints are covered by config/filetypes.lua instead.
-- The option is re-read on every check, so there is no load-order
-- dependency.

-- The plugin maps *.j2 to ft "jinja2" but only registers the "ansible"
-- language; point the ft at the jinja parser for TS highlighting.
vim.treesitter.language.register("jinja", "jinja2")

-- Buffers detected by this config (config/filetypes.lua) keep the
-- composite ft "yaml.ansible", which the plugin's own highlighting
-- autocmd does not cover -- start its language on them manually.
-- vim.treesitter.start() swaps the highlighter when the language changes.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_ansible_ts", { clear = true }),
  pattern = "yaml.ansible",
  callback = function(args)
    pcall(vim.treesitter.start, args.buf, "ansible")
  end,
})
