
return {
  -- nvim-web-devicons for file icons (used by lualine, telescope, etc)
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup {
        default = true;
      }
    end,
  },
  -- which-key with icon support
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
          icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜",  -- symbol used between a key and its label
            group = "+",      -- symbol prepended to a group
          },
        },
      })
    end,
  },
}
