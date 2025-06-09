#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -pa --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# enable git prompt
. ~/git-prompt.sh
GIT_PS1_SHOWUNTRACKEDFILES="enable"	
GIT_PS1_SHOWDIRTYSTATE="auto"
GIT_PS1_SHOWUPSTREAM="enable"

PROMPT_COMMAND='__git_ps1 "[\u@\h \w" "]$ "'

# PS1=$PROMPT_COMMAND
# PS1="[\u@\h \w]$ "
