" pecify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'scrooloose/nerdtree'

" Any valid git URL is allowed
Plug 'jalvesaq/Nvim-R'

" Initialize plugin system
call plug#end()
