
-- lua/plugins/colorscheme.lua
return {
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
}
