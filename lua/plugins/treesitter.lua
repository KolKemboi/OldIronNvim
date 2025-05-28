
-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "lua", "python", "bash", "c", "cpp" }, -- languages to install
      highlight = {
        enable = true,       -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = {
        enable = true
      },
    }
  end,
}
