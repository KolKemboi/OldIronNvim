
-- lua/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
      },
    })

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Telescope keymaps
    map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
    map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
    map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
    map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
  end,
}
