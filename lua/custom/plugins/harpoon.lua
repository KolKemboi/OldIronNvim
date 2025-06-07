return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    -- Optional: Telescope integration
    require('telescope').load_extension 'harpoon'

    -- Keymaps (customize as you like)
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = 'Harpoon Add File' })
    vim.keymap.set('n', '<leader>hh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon Quick Menu' })
    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon to File 1' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon to File 2' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon to File 3' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon to File 4' })
    vim.keymap.set('n', '<leader>5', function()
      harpoon:list():select(5)
    end, { desc = 'Harpoon to File 5' })
    vim.keymap.set('n', '<leader>6', function()
      harpoon:list():select(6)
    end, { desc = 'Harpoon to File 6' })

    -- Optional: Open with Telescope
    vim.keymap.set('n', '<leader>hf', ':Telescope harpoon marks<CR>', { desc = 'Telescope Harpoon Files' })
  end,
}
