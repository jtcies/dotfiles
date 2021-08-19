" install plugins
call plug#begin('~/.local/share/nvim/plugged')

    " theme
    Plug 'dracula/vim', { 'as': 'dracula' }
    
    " status bar
    Plug 'itchyny/lightline.vim'

    " lsp, completion, highlighting
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " fuzzy finder
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " repl
    Plug 'kassio/neoterm'

    "sql
    Plug 'tpope/vim-dadbod'

    " git
    Plug 'tpope/vim-fugitive'

    " others
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()

" PLUGIN OPTIONS --------------------------------
" autocompletion
set completeopt=menuone,noselect

" LSP Config Options -----------------------
" https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

lua << EOF
local nvim_lsp = require('lspconfig')
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

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'r_language_server', 'jedi_language_server' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

--tresitter
require'nvim-treesitter.configs'.setup {
ensure_installed = {'r', 'python'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    additional_vim_regex_highlighting = false,
  }
}

EOF

" enable autcompletion
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
set scl=yes  " leave space for sign column

" KEYMAPS -----------------------------

" map leader and localleader to space
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

xmap <leader>sr <Plug>(neoterm-repl-send)
nmap <leader>sr <Plug>(neoterm-repl-send)

" use escape to enter normal mode in terminal
tnoremap <Esc> <C-\><C-n>

" completion keymaps
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" open the file under the cursor using bash open
fu OpenFile()
   let l:file = expand('<cfile>')
   execute '!open ' . l:file
endfu 

nmap <leader>of :call OpenFile()<CR>

" movement between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" git commands
nnoremap <leader>gs :G<CR>

" other settings ------------------
set nocompatible 
set mouse=a " turn mouse on
filetype plugin on
filetype plugin indent on " fix indents
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" indenting
set autoindent
set smartindent


