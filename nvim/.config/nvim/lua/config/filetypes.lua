-- Extra filetype rules (:h vim.filetype.add()).

-- helm charts
vim.filetype.add({
  filename = {
    ["Chart.yaml"] = "helm",
    ["values.yaml"] = "helm",
  },
  pattern = {
    [".*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    [".*/values[%w_%-]*%.ya?ml"] = "helm", -- values-prod.yaml, values_dev.yaml
    [".*/values/.*%.ya?ml"] = "helm", -- values/prod.yaml
  },
})

-- ansible: composite ft "yaml.ansible" (yaml looks, ansiblels matches)
vim.filetype.add({
  filename = {
    ["ansible.yml"] = "yaml.ansible",
    ["ansible.yaml"] = "yaml.ansible",
    ["site.yml"] = "yaml.ansible",
    ["site.yaml"] = "yaml.ansible",
    ["playbook.yml"] = "yaml.ansible",
    ["playbook.yaml"] = "yaml.ansible",
    ["requirements.yml"] = "yaml.ansible", -- galaxy
    ["requirements.yaml"] = "yaml.ansible",
  },
  pattern = {
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/[^/]+/defaults/.*%.ya?ml"] = "yaml.ansible",
    [".*/vars/.*%.ya?ml"] = "yaml.ansible", -- any vars/, incl. roles/<name>/vars/
    [".*/roles/[^/]+/meta/.*%.ya?ml"] = "yaml.ansible",
    [".*/molecule/.*%.ya?ml"] = "yaml.ansible",
  },
})

-- ansible by content: playbooks/task files outside the dirs above. A plain
-- pattern rule can't do this: `priority = -math.huge` rules run after the
-- builtin `yml -> yaml` extension fallback, and priority >= 0 rules can
-- shadow other detections. Instead upgrade "yaml" buffers after normal
-- detection: helm templates/values, k8s manifests, gitlab-ci, docker-compose
-- are already claimed by then and never touched.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_ansible_detect", { clear = true }),
  pattern = "yaml",
  callback = function(args)
    if vim.bo[args.buf].filetype ~= "yaml" then
      return -- composite ft (yaml.docker-compose, ...): already claimed
    end
    local lines = vim.api.nvim_buf_get_lines(args.buf, 0, 500, false)
    for _, line in ipairs(lines) do
      if line:match("^%- *hosts:")
        or line:match("^%- *import_playbook:")
        or line:match("^#!.*ansible%-playbook") -- plugin shebang files
        or line:match("ansible%.builtin%.")
        or line:match("ansible%.legacy%.")
        or line:match("!vault")
      then
        -- re-fires FileType: treesitter restarts, ansiblels attaches
        vim.bo[args.buf].filetype = "yaml.ansible"
        return
      end
    end
  end,
})
