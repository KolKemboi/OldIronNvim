return {
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
  }
}
