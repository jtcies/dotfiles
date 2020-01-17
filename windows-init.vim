" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/appdata/local/nvim-data/plugged')

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
Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-dadbod'

Plug 'Yggdroot/indentLine'

Plug 'airblade/vim-gitgutter'

Plug 'itchyny/lightline.vim'

Plug 'vim-scripts/dbext.vim'


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

set number
set relativenumber
set timeoutlen=1000 ttimeoutlen=0

set mouse=a

let R_Path = 'c:\program files\R\R-3.6.1\bin\x64'
let R_set_home_env = 'c:\users\joseph.ciesielski'

let g:python3_host_prog = 'c:\users\joseph.ciesielski\anaconda3\python.exe'


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
set numberwidth=5
set timeoutlen=1000 ttimeoutlen=0

set mouse=a

let R_Path = 'c:\program files\R\R-3.6.1\bin\x64'
let R_set_home_env = 'c:\users\joseph.ciesielski'
let R_rconsole_width = 0
let R_rconsole_height = 20

let g:python3_host_prog = 'c:\users\joseph.ciesielski\anaconda3\python.exe'

au BufRead,BufNewFile *.md setlocal textwidth=80

set mouse=a

syntax on

set t_Co=256     
let &t_AB="\e[48;5;%dm"     
let &t_AF="\e[38;5;%dm"
color dracula
set nocompatible
set termguicolors
set termencoding=utf8
set guicursor=
set encoding=utf-8
let $TERM='xterm'

let g:indentLine_enabled = 1
let g:indentLine_char = "}"

nnoremap <Leader>t :CtrlP<CR>

set laststatus=2

let g:lightline = {
    \ 'colorscheme': 'dracula'
    \ }

let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1
let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }

let g:dbext_default_profile_re = 'type=SQLSRV:srvname=pmare:user=analytics:passwd=@askb'
let g:dbext_default_profile_sw = 'type=SQLSRV:integratedlogin=1:srvname=pmasiriussql:dbname=siriussql'
let g:dbext_default_type   = 're'

" auto commands for specific data analysis files
autocmd FileType r,rmd,python set colorcolumn=80
autocmd VimEnter * NERDTree | wincmd p
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

