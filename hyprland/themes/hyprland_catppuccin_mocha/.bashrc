#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=~/.local/bin:$PATH

alias ls='ls --color=auto'
alias ll='ls -al'
alias vim='nvim'
alias mc='EDITOR=nvim mc'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
