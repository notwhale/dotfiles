return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "hadolint",
        "shfmt",
        "flake8",
        "pyright",
        "black",
        "yamllint",
        "djlint",
        "ansible-lint",
        "sql-formatter",
        "prettier",
      },
    },
  },
}
