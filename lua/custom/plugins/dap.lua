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

          -- ✅ Updated dapui.setup with explicit layouts
          dapui.setup {
            layouts = {
              {
                elements = {
                  { id = 'scopes', size = 0.33 },
                  { id = 'breakpoints', size = 0.17 },
                  { id = 'stacks', size = 0.25 },
                  { id = 'watches', size = 0.25 },
                },
                size = 40, -- width
                position = 'left',
              },
              {
                elements = {
                  { id = 'repl', size = 0.5 },
                  { id = 'console', size = 0.5 },
                },
                size = 10, -- height
                position = 'bottom',
              },
            },
          }

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

      -- === Custom signs for breakpoints and debug states ===
      vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = 'Error', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶️', texthl = 'Success', linehl = 'Visual', numhl = 'Visual' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'WarningMsg', linehl = '', numhl = '' })

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
      dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = vim.fn.stdpath 'data' .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
      }

      dap.configurations.cpp = {
        {
          name = 'Launch file',
          type = 'cppdbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = true,
          setupCommands = {
            {
              text = '-enable-pretty-printing',
              description = 'Enable GDB pretty printing',
              ignoreFailures = false,
            },
          },
        },
      }

      dap.configurations.c = dap.configurations.cpp
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
