# config for managing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# alias for neovim
alias nvim='/usr/local/bin/neovim/nvim.appimage'

# promt for fish/pure
set -g pure_symbol_prompt ">"

# add node to path
set PATH /usr/local/bin/nodejs/node-v12.16.1-linux-x64 $PATH
# add tinytex to path
set PATH $HOME/bin $PATH
# add sqlcmd
set PATH /opt/mssql-tools/bin $PATH
