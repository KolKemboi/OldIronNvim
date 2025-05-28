return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
      "saghen/blink.nvim",
      config = function()
        require("blink").setup()  -- initialize blink after cmp is loaded
      end,
    },
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          -- Add a snippet engine if needed (like luasnip)
        end,
      },
mapping = cmp.mapping.preset.insert({
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif vim.fn.col('.') ~= 1 and vim.fn.getline('.'):sub(vim.fn.col('.') - 1, vim.fn.col('.') - 1):match("%s") == nil then
      cmp.complete()
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<CR>"] = cmp.mapping.confirm({ select = true }),
}),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
