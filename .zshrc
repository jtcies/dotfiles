# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jtcies/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-kubectl-prompt)

alias r="/Library/Frameworks/R.framework/Versions/Current/Resources/bin/R"

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/Library/Frameworks/R.framework/Versions/Current/Resources/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Created by `pipx` on 2021-08-12 13:27:56
export PATH="$PATH:/Users/jtcies/.local/bin"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
eval "$(pyenv virtualenv-init -)"

source $ZSH/oh-my-zsh.sh

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
