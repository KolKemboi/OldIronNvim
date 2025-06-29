return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {
        check_ts = true, -- Enable treesitter integration
        disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
        fast_wrap = {
          map = '<M-e>', -- Alt+e to trigger fast wrap
          chars = { '{', '[', '(', '"', "'", '`' },
          pattern = [=[[%'%"%>%]%)%}%,]]=],
          offset = 0,
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'PmenuSel',
          highlight_grey = 'LineNr',
        },
      }
    end,
  },
}
