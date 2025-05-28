-- plugins/comment.lua
return {
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
      -- Optional: custom keymap override
      local map = vim.keymap.set
      map('n', '<leader>k', function()
        require('Comment.api').toggle.linewise.current()
      end, { desc = 'Toggle comment' })
      map('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = 'Toggle comment' })
    end,
  },
}
