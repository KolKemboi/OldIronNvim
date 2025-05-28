-- ~/.config/nvim/lua/plugins/dap.lua

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'nvim-neotest/nvim-nio',
      },
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          local dap, dapui = require 'dap', require 'dapui'
          dapui.setup()

          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
          end
        end,
      },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Debug keymaps with <leader>b prefix
      map('n', '<leader>bu', dapui.toggle, { desc = 'Toggle DAP UI', noremap = true, silent = true })
      map('n', '<leader>bs', function()
        if dap.session() then
          dap.terminate()
        else
          dap.continue()
        end
      end, { desc = 'Start or Stop Debugging', noremap = true, silent = true })
      map('n', '<leader>bb', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint', noremap = true, silent = true })
      map('n', '<leader>bo', dap.step_over, { desc = 'Step Over', noremap = true, silent = true })
      map('n', '<leader>bi', dap.step_into, { desc = 'Step Into', noremap = true, silent = true })
      map('n', '<leader>bO', dap.step_out, { desc = 'Step Out', noremap = true, silent = true })
      map('n', '<leader>br', dap.repl.open, { desc = 'Open REPL', noremap = true, silent = true })
      map('n', '<leader>bl', dap.run_last, { desc = 'Run Last Debug Session', noremap = true, silent = true })

      -- Example adapter for Python debugging
      dap.adapters.python = {
        type = 'executable',
        command = 'python',
        args = { '-m', 'debugpy.adapter' },
      }

      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          pythonPath = function()
            return 'python' -- customize if you use virtualenvs
          end,
        },
      }
    end,
  },
}
