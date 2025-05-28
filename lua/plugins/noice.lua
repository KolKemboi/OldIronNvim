
-- plugins/noice.lua
return {
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
}
