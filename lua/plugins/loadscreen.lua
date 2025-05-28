
-- In your plugins.lua or lazy.lua file

return {
  -- other plugins...

  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      dashboard = {
        enabled = true,
        header = {
          "________  .__      .___.___                      ",
          "\\_____  \\ |  |   __| _/|   |______  ____   ____  ",
          " /   |   \\|  |  / __ | |   \\_  __ \\/  _ \\ /    \\ ",
          "/    |    \\  |_/ /_/ | |   ||  | \\(  <_> )   |  \\",
          "\\_______  /____|____ | |___||__|   \\____/|___|  /",
          "        \\/          \\/                        \\/ ",
          "                                                 ",
          "                                                 ",
        },
        footer = {
          "🚀 Happy Hacking with Neovim!",
        },
      },
    },
  },

  -- other plugins...
}
