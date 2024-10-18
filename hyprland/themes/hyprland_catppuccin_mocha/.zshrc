export PATH=~/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

ZSH_THEME="awesomepanda"

plugins=(poetry docker docker-compose golang git-flow git git-commit zsh-autosuggestions zsh-syntax-highlighting you-should-use)

source $ZSH/oh-my-zsh.sh

# Alias
alias cat="bat"
alias ls="exa --icons"
alias ll="exa --icons -al"
alias vim="nvim"
