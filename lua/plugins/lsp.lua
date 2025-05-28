return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Optional: if using completion (nvim-cmp)
      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities() or {}
      )

      local on_attach = function(client, bufnr)
        local bufmap = function(mode, lhs, rhs, desc)
          if desc then
            desc = "LSP: " .. desc
          end
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Keymaps
        bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
        bufmap("n", "K", vim.lsp.buf.hover, "Hover info")
        bufmap("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        bufmap("n", "gr", vim.lsp.buf.references, "References")
        bufmap("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format code")
      end

      -- Example server setups
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },

}
