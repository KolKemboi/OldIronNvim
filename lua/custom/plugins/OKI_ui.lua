return {
  -------------------------- ICONS ------------------------
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },
  --------------------------LOADING SCREEN ------------------------
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.header.val = {
        ' ',
        ' ██████╗ ██╗     ██████╗    ██╗██████╗  ██████╗ ███╗   ██╗',
        '██╔═══██╗██║     ██╔══██╗   ██║██╔══██╗██╔═══██╗████╗  ██║',
        '██║   ██║██║     ██║  ██║   ██║██████╔╝██║   ██║██╔██╗ ██║',
        '██║   ██║██║     ██║  ██║   ██║██╔══██╗██║   ██║██║╚██╗██║',
        '╚██████╔╝███████╗██████╔╝   ██║██║  ██║╚██████╔╝██║ ╚████║',
        ' ╚═════╝ ╚══════╝╚═════╝    ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝',
        '                                                          ',
        '                    ██╗  ██╗ ██████╗ ██╗                  ',
        '                    ██║ ██╔╝██╔═══██╗██║                  ',
        '                    █████╔╝ ██║   ██║██║                  ',
        '                    ██╔═██╗ ██║   ██║██║                  ',
        '                    ██║  ██╗╚██████╔╝███████╗             ',
        '                    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝             ',
        '                                                          ',
        '                ━┓━┓ ┏┓┏┓  ┏┓┏┓    ━┓┏┓ ┏┓┏┓              ',
        '              ━━ ┃ ┃ ┣┫┏┛   ┃┃   ━━ ┃┣┫ ┏┛┗┫              ',
        '                 ╹ ╹•┗┛┗━  ┗┛┗┛     ╹┗┛•┗━┗┛              ',
        ' ',
        ' ',
      }

      -- Set header highlight to green
      vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#52bf90' })
      dashboard.section.header.opts = {
        hl = 'DashboardHeader',
        position = 'center',
      }

      -- Disable buttons and footer
      dashboard.section.buttons.val = {}
      dashboard.section.footer.val = {}

      -- Final setup
      alpha.setup(dashboard.config)
    end,
  },
  ----------------COLOR-SCHEME----------------
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000, -- Load before other plugins
    opts = {
      style = 'storm', -- or "night", "moon", "day"
      transparent = true, -- 💡 this enables transparent background
      terminal_colors = true,
      styles = {
        sidebars = 'transparent', -- left and right splits
        floats = 'transparent', -- floating windows
      },
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
  -------------------NOICE------------------------------

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        presets = {
          bottom_search = true, -- like VSCode search
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
      }

      -- optional: setup notify as backend
      vim.notify = require 'notify'
    end,
  },
  -----------------------INCLINE------------------

  {
    'b0o/incline.nvim',
    event = 'VeryLazy',
    config = function()
      require('incline').setup {
        highlight = {
          groups = {
            InclineNormal = { default = true, group = 'CursorLine' },
            InclineNormalNC = { default = true, group = 'CursorLine' },
          },
        },
        window = {
          margin = {
            vertical = 0,
            horizontal = 1,
          },
          options = {
            signcolumn = 'no',
            wrap = false,
          },
          padding = 1,
          placement = {
            vertical = 'top',
            horizontal = 'right',
          },
        },
      }
    end,
  },
  ---------------------------LUA LINE----------------------

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto', -- Or 'gruvbox', 'tokyonight', etc.
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 0 } }, -- 0: just filename, 1: relative path
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { 'nvim-tree', 'quickfix', 'fugitive', 'lazy' },
      }
    end,
  },
  ----------------------------GIT SIGNS--------------------------

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}
