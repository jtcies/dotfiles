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

