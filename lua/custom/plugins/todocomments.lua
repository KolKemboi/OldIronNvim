return {
  -- TODO:
  -- FIX:
  -- HACK:
  -- PERF:
  -- WARN:
  -- NOTE:
  --
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true,
      keywords = {
        FIX = { icon = ' ', color = 'error', alt = { 'BUG', 'FIXME' } },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING' } },
        PERF = { icon = ' ', color = 'default', alt = { 'OPTIMIZE' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
      },
      highlight = {
        keyword = 'bg', -- or "wide", "fg"
        after = '', -- show nothing after the keyword
      },
      search = {
        command = 'rg',
        args = { '--color=never', '--no-heading', '--with-filename', '--line-number', '--column' },
        pattern = [[\b(KEYWORDS):]], -- regex for matching keywords
      },
    },
  },
}
