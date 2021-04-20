" install plugins
call plug#begin('~/.local/share/nvim/plugged')

    " theme
    Plug 'dracula/vim', { 'as': 'dracula' }
    
    " context switching between vim and tmux
	Plug 'christoomey/vim-tmux-navigator'

    " status bar

    " autcompletion
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'jalvesaq/Nvim-R' " r
    Plug 'gaalcaras/ncm-R' " r
    Plug 'ncm2/ncm2-jedi' " python
    Plug 'ncm2/ncm2-bufword' " words in buffer
    Plug 'ncm2/ncm2-path' " path

    " repl
    Plug 'jpalardy/vim-slime'

    " linting
    Plug 'dense-analysis/ale'

" Initialize plugin system
call plug#end()

" PLUGIN OPTIONS --------------------------------
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

let R_path='/Library/Frameworks/R.framework/Versions/Current/Resources/bin'

" use two underscores for assignment operator
let R_assign = 2

" use neovim termianl with vim slime
let g:slime_target = "neovim"

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
