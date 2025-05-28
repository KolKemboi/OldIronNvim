
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        -- No snippet engine configured; if you want one, add here
        expand = function(args)
          -- For example: require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = {
        -- Tab to autocomplete common prefix (like autopopulate)
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- insert common prefix of items without confirming selection
            cmp.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert })
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Ctrl-Tab to move down the list
        ["<C-Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

        -- Shift-Ctrl-Tab to move up the list
        ["<S-C-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

        -- Disable Enter key confirmation
        ["<CR>"] = cmp.mapping(function(fallback)
          -- Do nothing on Enter when menu visible
          if cmp.visible() then
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
