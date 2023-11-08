-- for new sql file, automatically set buffer db to dev by default
-- and set keymap to run selection
-- if no g:dev, set it in after/plugins/dburls.lua
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = { "sql" },
  command = [[
    let b:db = ''
    vnoremap <leader>r :DB b:db<CR>
    ]]
}
)
