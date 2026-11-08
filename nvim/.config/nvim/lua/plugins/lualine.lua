require('lualine').setup {
  options = {
    theme = 'gruvbox',
    icons_enabled = false,
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_y = { { 'searchcount', maxcount = 999, timeout = 500, }, 'progress' }
  }
}
