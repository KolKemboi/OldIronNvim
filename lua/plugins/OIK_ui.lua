return {
--------------------------LOADING SCREEN ------------------------
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        " ",
        " ██████╗ ██╗     ██████╗ ██╗██████╗  ██████╗ ███╗   ██╗",
        "██╔═══██╗██║     ██╔══██╗██║██╔══██╗██╔═══██╗████╗  ██║",
        "██║   ██║██║     ██║  ██║██║██████╔╝██║   ██║██╔██╗ ██║",
        "██║   ██║██║     ██║  ██║██║██╔══██╗██║   ██║██║╚██╗██║",
        "╚██████╔╝███████╗██████╔╝██║██║  ██║╚██████╔╝██║ ╚████║",
        " ╚═════╝ ╚══════╝╚═════╝ ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝",
        "                                                       ",
        "                   ██╗  ██╗ ██████╗ ██╗                ",
        "                   ██║ ██╔╝██╔═══██╗██║                ",
        "                   █████╔╝ ██║   ██║██║                ",
        "                   ██╔═██╗ ██║   ██║██║                ",
        "                   ██║  ██╗╚██████╔╝███████╗           ",
        "                   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝           ",
        " ",
        " ",
      }

      -- Set header highlight to green
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#52bf90" })
      dashboard.section.header.opts = {
        hl = "DashboardHeader",
        position = "center",
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
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Load before other plugins
    opts = {
      style = "storm", -- or "night", "moon", "day"
      transparent = true, -- 💡 this enables transparent background
      terminal_colors = true,
      styles = {
       sidebars = "transparent", -- left and right splits
       floats = "transparent",   -- floating windows
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
---------------------------LUA LINE---------------------
{
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto", -- or "gruvbox", "tokyonight", etc.
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
      },
    })
  end,
},
----------------------------ICONS-----------------------
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
  -------------------NOICE------------------------------


 {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      presets = {
        bottom_search = true, -- like VSCode search
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    })

    -- optional: setup notify as backend
    vim.notify = require("notify")
  end,
},

}

