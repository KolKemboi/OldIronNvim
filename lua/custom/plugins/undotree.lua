-- ~/.config/nvim/lua/plugins/undotree.lua

return {
  'mbbill/undotree',
  config = function()
    -- Optional: Set some preferences
    vim.g.undotree_WindowLayout = 2 -- horizontal split
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SetFocusWhenToggle = 1

    -- Keybinding to toggle UndoTree with <leader>ut
    vim.keymap.set('n', '<leader>ut', '<cmd>UndotreeToggle<CR>', { desc = 'Toggle Undotree' })
  end,
}
