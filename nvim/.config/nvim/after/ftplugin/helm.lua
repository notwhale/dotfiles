-- "helm" is a custom ft: no builtin ftplugin, so 'commentstring' stays empty.
-- YAML-shaped chart files use "#"; go-template .tpl files use helm comments.
vim.opt_local.commentstring = vim.fn.expand("%:e") == "tpl" and "{{/* %s */}}" or "# %s"
