" pecify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'scrooloose/nerdtree'

" Any valid git URL is allowed
Plug 'jalvesaq/Nvim-R'

" csv viewer
Plug 'chrisbra/csv.vim'

" linter
Plug 'w0rp/ale'

" r autocompletion
Plug 'gaalcaras/ncm-R'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Optional: for snippet support
Plug 'sirver/UltiSnips'
Plug 'ncm2/ncm2-ultisnips'

Plug 'junegunn/goyo.vim'

" context switching between vim and tmux
Plug 'christoomey/vim-tmux-navigator'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'tpope/vim-dadbod'

Plug 'Yggdroot/indentLine'

Plug 'airblade/vim-gitgutter'

Plug 'itchyny/lightline.vim'

Plug 'vim-scripts/dbext.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Shortcut for R's assignment operator: 0 turns it off; 1 assigns underscore; 2 assigns two underscores
let R_assign = 2

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

let g:rmd_fenced_languages = ['r', 'python']
let g:markdown_fenced_languages = ['r', 'python']

map <leader>f :Goyo <CR>
map <leader>nt :NERDTree <CR>

set number
set relativenumber
set timeoutlen=1000 ttimeoutlen=0

set mouse=a

let R_path='/usr/local/lib/R'

let g:python3_host_prog='/usr/bin/python3'

au BufRead,BufNewFile *.md setlocal textwidth=80

set mouse=a

syntax on
color dracula
let g:lightline = {
      \ 'colorscheme': 'dracula'
      \ }

let g:sw_exe='~/sqlworkbench/sqlwbconsol.sh'

let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

nnoremap <Leader>t :CtrlP<CR>

set laststatus=2

let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1
let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }

" auto commands for specific data analysis files
autocmd FileType r,rmd,python set colorcolumn=80
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

let R_rconsole_width = 0
let R_rconsole_height = 20

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

set cursorline

let R_openhtml = 0

" close vim if NT is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

