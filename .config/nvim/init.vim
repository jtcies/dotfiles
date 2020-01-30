" INSTALL PLUGINS ------------------

call plug#begin('~/.local/share/nvim/plugged')

	Plug 'scrooloose/nerdtree'

    Plug 'kassio/neoterm'

	Plug 'junegunn/goyo.vim'
	
	" context switching between vim and tmux
	Plug 'christoomey/vim-tmux-navigator'

	Plug 'dracula/vim', { 'as': 'dracula' }

	Plug 'itchyny/lightline.vim'

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()

" PLUGIN OPTIONS --------------------------------

" close vim if NT is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:neoterm_default_mod = 'vert'
let g:neoterm_autoscroll = 1      " autoscroll to the bottom when entering insert mode
let g:neoterm_keep_term_open = 0  " when buffer closes, exit the terminal too.

" THEME -----------------------------------------

set number
set relativenumber
set timeoutlen=1000 ttimeoutlen=0

syntax on
color dracula
let g:lightline = {
      \ 'colorscheme': 'dracula'
      \ }

" KEYMAPS -----------------------------

" leader-f Goyo
map <leader>f :Goyo <CR>

" leader-nt Nerdtree
map <leader>nt :NERDTree <CR>

" OTHER OPTIONS -----------------------

" fix indents
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set mouse=a

" send paragraph to terminal
nnoremap <leader>pp vip:TREPLSendSelection<CR>} 

" send file to terminal
nnoremap <leader>ff :TREPLSendFile<CR>

" use esc to enter normal mode in the terminal
tnoremap <Esc> <C-\><C-n> 
