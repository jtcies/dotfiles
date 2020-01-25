" Plugins

call plug#begin('~/.local/share/nvim/plugged')

	Plug 'scrooloose/nerdtree'

	Plug 'jpalardy/vim-slime'

	Plug 'junegunn/goyo.vim'
	
	" context switching between vim and tmux
	Plug 'christoomey/vim-tmux-navigator'

	Plug 'dracula/vim', { 'as': 'dracula' }

	Plug 'itchyny/lightline.vim'

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()

map <leader>f :Goyo <CR>
map <leader>nt :NERDTree <CR>

set number
set relativenumber
set timeoutlen=1000 ttimeoutlen=0

set mouse=a

syntax on
color dracula
let g:lightline = {
      \ 'colorscheme': 'dracula'
      \ }

" close vim if NT is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" configure vim-slime and tmux
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

" fix indents
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
