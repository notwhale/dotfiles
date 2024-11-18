vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  -- group = augroup("ansible_detect"),
  pattern = {
    "*/tasks/*.yml",
    "*/tasks/*.yaml",
    "*/playbooks/*.yml",
    "*/playbooks/*.yaml",
    "*/roles/*/tasks/*.yml",
    "*/roles/*/tasks/*.yaml",
    "*/roles/*/handlers/*.yml",
    "*/roles/*/handlers/*.yaml",
  },
  -- command = "setlocal filetype=yaml.ansible",
  callback = function()
    vim.cmd("set filetype=yaml.ansible")
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  -- group = augroup("ansible_detect"),
  pattern = {
    "*.j2",
  },
  -- command = "setlocal filetype=htmldjango",
  callback = function()
    vim.cmd("set filetype=htmldjango")
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  -- group = augroup("jenkinsfile_detect"),
  pattern = {
    "Jenkinsfile",
    "*.Jenkinsfile",
    "*/*.Jenkinsfile",
  },
  callback = function()
    vim.cmd("set filetype=groovy")
    vim.cmd("set tabstop=4 softtabstop=4 shiftwidth=4")
  end,
})
