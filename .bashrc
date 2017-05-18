alias mv='mv -i'
alias cp='cp -i'
alias l='ls'
alias ls='ls -G --color'
alias delete_merged_local_branches='git branch -d $(git branch --merged | grep -v "^\*" | grep -v master)'
alias gg='git grep --line-number'

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

gv() {
    # Open the search files in vim
    vim $(git grep -l "$@")
}

gbranch() {
    git fetch origin && git checkout origin/master -b "$1"
}

export PATH=$HOME/bin:$PATH
export HISTCONTROL=ignorespace:ignoredups
export HISTIGNORE='fg:mm'
export HISTSIZE=50000

if [ -z "$SSH_AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
fi

set -o vi
export PYTHONSTARTUP=~/.pythonrc.py

#Put stuff in .bashrc_local that varies based on particular machines
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
