require('gitsigns').setup({
  -- signs = {
  --   add          = { text = '▎' },
  --   change       = { text = '▎' },
  --   delete       = { text = '' },
  --   topdelete    = { text = '' },
  --   changedelete = { text = '▎' },
  --   untracked    = { text = '▎' },
  -- },
  -- defaults: add/change='┃', delete='▁', topdelete='▔', changedelete='~', untracked='┆'
  --
  -- signcolumn         = true,  -- default:
  -- numhl              = false,
  -- linehl             = false,
  -- show_deleted       = false,
  -- current_line_blame = false,
  -- word_diff          = false,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
    end

    -- navigation
    map('n', ']h', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gs.nav_hunk('next')
      end
    end, 'Git: Next Hunk')
    map('n', '[h', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gs.nav_hunk('prev')
      end
    end, 'Git: Prev Hunk')
    map('n', ']H', function() gs.nav_hunk('last') end, 'Git: Last Hunk')
    map('n', '[H', function() gs.nav_hunk('first') end, 'Git: First Hunk')

    -- hunks
    map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', 'Git: Stage Hunk')
    map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', 'Git: Reset Hunk')
    map('n', '<leader>ghS', gs.stage_buffer, 'Git: Stage Buffer')
    map('n', '<leader>ghu', gs.undo_stage_hunk, 'Git: Undo Stage Hunk')
    map('n', '<leader>ghR', gs.reset_buffer, 'Git: Reset Buffer')
    map('n', '<leader>ghp', gs.preview_hunk_inline, 'Git: Preview Hunk Inline')

    -- blame
    map('n', '<leader>ghb', function() gs.blame_line({ full = true }) end, 'Git: Blame Line')
    map('n', '<leader>ghB', function() gs.blame() end, 'Git: Blame Buffer')

    -- diff
    map('n', '<leader>ghd', gs.diffthis, 'Git: Diff This')
    map('n', '<leader>ghD', function() gs.diffthis('~') end, 'Git: Diff This ~HEAD')

    -- text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'Git: Select Hunk')
  end,
})
