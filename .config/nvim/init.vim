" INSTALL PLUGINS ------------------

call plug#begin('~/.local/share/nvim/plugged')

	Plug 'scrooloose/nerdtree'

	Plug 'junegunn/goyo.vim'
	
	" context switching between vim and tmux
	Plug 'christoomey/vim-tmux-navigator'

	Plug 'dracula/vim', { 'as': 'dracula' }

	Plug 'itchyny/lightline.vim'

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " lsp
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'chrisbra/csv.vim'

    " sql
    Plug 'vim-scripts/dbext.vim'

    " r and autcompletion
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'jalvesaq/Nvim-R'
    Plug 'gaalcaras/ncm-R'
    
    " vim wiki
    Plug 'vimwiki/vimwiki'

" Initialize plugin system
call plug#end()

" PLUGIN OPTIONS --------------------------------
" vimwiki plugins
let g:vimwiki_list = [{'path': '~/jtcwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" close vim if NT is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" use two underscores for assignment operator
let R_assign = 2

" set python3 location for nvim-yarp/ncm
let g:python3_host_prog='/usr/bin/python3'

" use r and python is rmd chunks
let g:markdown_fenced_languages = ['r', 'python']
let g:rmd_fenced_languages = ['r', 'python']

" THEME and STYLE ---------------------------

set number
set relativenumber
set timeoutlen=1000 ttimeoutlen=0

syntax on
color dracula
let g:lightline = {
      \ 'colorscheme': 'dracula'
      \ }

" KEYMAPS -----------------------------

" map leader and localleader to space
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" leader-f Goyo
map <silent><leader>f :Goyo <CR>

" leader-nt Nerdtree
map <silent><leader>nt :NERDTree <CR>

" use esc to enter normal mode in the terminal
tnoremap <Esc> <C-\><C-n>

" pipe for R functions
inoremap <A-M>  %>%

" mark a todo list item done
" default is ctrl-space but that is used by tmux in my config
" use in normal or visual mode
map <Leader>tt <Plug>VimwikiToggleListItem

" OTHER OPTIONS -----------------------

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

set nocompatible 

" turn mouse on
set mouse=a

