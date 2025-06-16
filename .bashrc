#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -pa --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

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
GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_STATESEPARATOR=""

red="$(tput setaf 1 )"
yellow="$(tput setaf 3 )"
blue="$(tput setaf 4 )"
magenta="$(tput setaf 5 )"

bright_red="$(tput setaf 9 )"
bright_green="$(tput setaf 10 )"
bright_blue="$(tput setaf 12 )"

reset="$(tput sgr0 )"

PROMPT_COMMAND='__prompt_command'

__prompt_command() {
    EXIT="$?"
    raw_branch="$(__git_ps1 '%s')"

    if [ -n "$raw_branch" ]; then
        git_branch="${blue} git:(${red}${raw_branch}${blue})"
    else
        git_branch=""
    fi

    if [ "$EXIT" -ne 0 ]; then
        PS1='${bright_red}  ${bright_blue}\W${git_branch} ${magenta} ${reset}'
    else
        PS1='${bright_green}  ${bright_blue}\W${git_branch} ${magenta} ${reset}'
    fi
}


# PS1=$PROMPT_COMMAND
# PS1="[\u@\h \w]$ "
