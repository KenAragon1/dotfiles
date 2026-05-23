#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -p --color=auto'
alias grep='grep --color=auto'

export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

export SUDO_ASKPASS="$HOME/scripts/program/askpass"
export FZF_DEFAULT_OPTS="--layout=reverse"

# nvm
export NVM_DIR="$HOME/opts/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

eval "$(fzf --bash)"
