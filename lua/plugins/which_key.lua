return {
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
      },
    })

    -- Normal mode mappings
    wk.register({
      -- Close buffer or pane
      ["<leader>c"] = { "<cmd>bd<cr>", "Close buffer/pane" },

      -- Find group
      ["<leader>f"] = {
        name = "Find",
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        f = { "<cmd>Telescope find_files<cr>", "Find files" },
        g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
        h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
      },

      -- Panes group
      ["<leader>p"] = {
        name = "Panes",
        ["-p"] = { "<cmd>wincmd j<cr>", "Next pane down" },
        ["+p"] = { "<cmd>wincmd k<cr>", "Next pane up" },
        ["[p"] = { "<cmd>wincmd h<cr>", "Next pane left" },
        ["]p"] = { "<cmd>wincmd l<cr>", "Next pane right" },
        h = { "<cmd>split<cr>", "Horizontal split" },
        v = { "<cmd>vsplit<cr>", "Vertical split" },
      },

      -- Terminal group
      ["<leader>t"] = {
        name = "Terminal",
        h = { "<cmd>split | terminal<cr>", "Horizontal terminal" },
      },

      -- Toggle comment line
      ["<leader>/"] = {
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        "Toggle comment line",
      },
    }, { mode = "n" })

    -- Visual mode comment toggle
    wk.register({
      ["<leader>/"] = {
        function()
          require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end,
        "Toggle comment block",
      },
    }, { mode = "v" })
  end,
}
