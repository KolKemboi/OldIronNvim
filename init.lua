
-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tab and indentation settings
vim.opt.tabstop = 2        -- A tab is 4 spaces
vim.opt.shiftwidth = 2     -- Indent by 4 spaces
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart indenting on new lines

-- Other basic settings (optional but useful)
vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = true     -- Relative line numbers
vim.opt.mouse = "a"               -- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.cursorline = true         -- Highlight current line

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Terminal at the bottom with <leader>th
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("botright split")     -- Open at the bottom
  vim.cmd("resize 15")          -- Optional: set terminal height
  -- Close current buffer with <leader>c
-- Close current buffer with <leader>c
vim.keymap.set("n", "<leader>c", ":bd<CR>", { desc = "Close buffer" })
  vim.keymap.set("n", "<leader>c", ":bd<CR>", { desc = "Close buffer" })
  vim.cmd("terminal")           -- Open terminal
  vim.cmd("startinsert")        -- Start in insert mode
end, { desc = "Open bottom terminal" })

-- Open vertical split with <leader>pv
vim.keymap.set("n", "<leader>pv", function()
  vim.cmd("vsplit")
end, { desc = "Vertical split" })

-- Open horizontal split with <leader>ph
vim.keymap.set("n", "<leader>ph", function()
  vim.cmd("split")
end, { desc = "Horizontal split" })

-- Move to the right pane with ]p
vim.keymap.set("n", "]p", "<C-w>l", { desc = "Move to right pane" })

-- Move to the left pane with [p
vim.keymap.set("n", "[p", "<C-w>h", { desc = "Move to left pane" })

-- Move between vertical panes with -p
vim.keymap.set("n", "-p", "<C-w>w", { desc = "Cycle vertically through panes" })


-- Up
vim.keymap.set("n", "[P", "<C-w>k", { desc = "Move to upper pane" })

-- Down
vim.keymap.set("n", "]P", "<C-w>j", { desc = "Move to lower pane" })

-- Close current pane (window) with <leader>c
vim.keymap.set("n", "<leader>c", "<C-w>c", { desc = "Close current window" })
-- Close current buffer with <leader>c
vim.keymap.set("n", "<leader>c", ":bd<CR>", { desc = "Close buffer" })












-- Load plugins from separate Lua file
require("lazy").setup("plugins")
