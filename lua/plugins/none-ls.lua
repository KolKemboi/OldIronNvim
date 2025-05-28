return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Lua formatter
        null_ls.builtins.formatting.stylua,

        -- C/C++ formatter with Allman style
        null_ls.builtins.formatting.clang_format.with({
          extra_args = { "--style=Allman" },
          filetypes = { "c", "cpp", "objc", "objcpp" },
        }),

        -- Optional: C++ linters (uncomment if needed)
        -- null_ls.builtins.diagnostics.cpplint,
        -- null_ls.builtins.diagnostics.clang_check,
      },
    })

    -- Manual format keymap
    vim.keymap.set('n', "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, {})
  end,
}
