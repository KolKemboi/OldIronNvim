return {
  {
    'stevearc/dressing.nvim', -- optional for prettier popups
    event = 'VeryLazy',
    opts = {},

    config = function()
      local function create_file_popup()
        local cwd = vim.fn.getcwd()

        vim.ui.input({ prompt = 'Create file (relative to cwd): ', default = './' }, function(input)
          if input and input ~= '' then
            local path = cwd .. '/' .. input
            vim.fn.mkdir(vim.fn.fnamemodify(path, ':h'), 'p')
            vim.cmd('edit ' .. path)
            vim.notify('Created: ' .. vim.fn.fnamemodify(path, ':.'), vim.log.levels.INFO)
          end
        end)
      end

      vim.keymap.set('n', '<leader>nf', create_file_popup, { desc = 'Create New File (Popup)' })
    end,
  },

  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
      columns = { 'icon' },
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = {
      { 'echasnovski/mini.icons', opts = {} },
      -- { "nvim-tree/nvim-web-devicons" }, -- Uncomment if preferred
    },
    lazy = false,
    keys = {
      {
        '<leader>tf',
        '<cmd>Oil --float<CR>',
        desc = 'File Buffer (Oil)',
      },
    },
  },
}
