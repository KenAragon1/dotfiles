#
# ~/.bash_profile
#
[[ -f ~/.bashrc ]] && . ~/.bashrc

export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
export PATH=$PATH:$HOME/go/bin

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave"
export PAGER="less"
export TERMINAL="alacritty"

export PATH=$HOME/.local/bin:$PATH
