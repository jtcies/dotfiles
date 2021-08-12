" install plugins
call plug#begin('~/.local/share/nvim/plugged')

    " theme
    Plug 'dracula/vim', { 'as': 'dracula' }
    
    " status bar
    Plug 'itchyny/lightline.vim'

    " lsp and config
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'

    " repl
    Plug 'jpalardy/vim-slime'

" Initialize plugin system
call plug#end()

" PLUGIN OPTIONS --------------------------------
" use neovim termianl with vim slime
let g:slime_target = "neovim"

" autocompletion
set completeopt=menuone,noselect

" LSP Config Options -----------------------
" https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

lua << EOF
-- language servers

-- R
-- install.packages("languageserver")
require'lspconfig'.r_language_server.setup{}

-- Python
-- pipx install jedi-language-server
require'lspconfig'.jedi_language_server.setup{}

-- diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
})

function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  opts = opts or {}

  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)

  local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line_nr, opts, client_id)
  if vim.tbl_isempty(line_diagnostics) then return end

  local diagnostic_message = ""
  for i, diagnostic in ipairs(line_diagnostics) do
    diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
    print(diagnostic_message)
    if i ~= #line_diagnostics then
      diagnostic_message = diagnostic_message .. "\n"
    end
  end
  vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
end

vim.cmd [[ autocmd CursorHold * lua PrintDiagnostics() ]]

EOF

"https://github.com/hrsh7th/nvim-compe/blob/master/doc/compe.txt
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:false
let g:compe.source = {
    \ 'path': v:true,
    \ 'buffer': v:true,
    \ 'nvim_lsp': v:true,
    \ }

" THEME and STYLE ---------------------------
let g:dracula_colorterm = 0 
syntax on
color dracula
let g:lightline = {
      \ 'colorscheme': 'dracula'
      \ }
set t_Co=256
set termguicolors
set number
set relativenumber


" KEYMAPS -----------------------------

" map leader and localleader to space
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

let g:slime_no_mappings = 1 " remove default vim-slime mappings
xmap <leader>sr <Plug>SlimeRegionSend
nmap <leader>sr <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig

" use escape to enter normal mode in terminal
tnoremap <Esc> <C-\><C-n>

" completion keymaps
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" open the file under the cursor using bash open
fu OpenFile()
   let l:file = expand('<cfile>')
   execute '!open ' . l:file
endfu 

nmap <leader>of :call OpenFile()<CR>

" other settings ------------------
set nocompatible 

" turn mouse on
set mouse=a

filetype plugin on
" fix indents
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" indenting
set autoindent
set smartindent

" leave space for sign column
set scl=yes

