require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'vim' },
  sync_install = false,
  auto_install = true,
  highlight = {
    enabele = true,
  }
}
