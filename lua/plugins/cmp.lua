
return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets", -- Preconfigured snippets
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      opts.snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      }

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),                       -- Show completion menu
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),          -- Accept suggestion
        ["<S-Tab>"] = cmp.mapping.select_next_item(),                -- Next item
        ["<C-Tab>"] = cmp.mapping.select_prev_item(),                -- Previous item
        ["<C-e>"] = cmp.mapping.abort(),                             -- Cancel
        ["<CR>"] = cmp.mapping.confirm({ select = false }),          -- Confirm if explicitly selected
      })

      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      })

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    end,
  },
}

