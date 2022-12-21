-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


vim.g.mapleader = ' '
map('t', '<Esc>', '<C-\\><C-n>')  -- exit terminal mode with escape
map('n', '<leader>fe', ':Ex <cr>')

vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever
-- paste but send wha'ts overwritten to void register
vim.keymap.set("v", "<leader>p", "\"_dP")

-- switch windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- copy to system clipboard


