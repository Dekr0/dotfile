#!/usr/bin/env sh

# [basic]
alias cp="cp -i"
alias df="df -h"
alias free="free -m"
alias ld="lsblk -f"
alias shutdown="shutdown now"

# [basic.ls]
eval "$(dircolors -b)"
alias ls="ls --color=auto"
alias lsl="ls -l"
alias lsa="ls -la"

# [basic.nvim]
alias vi="nvim"

# [python]
# [python.env]
alias ipv="python3 -m venv venv && touch requirements.txt"
alias rpv="source ./venv/bin/activate"
alias dipv="python3 -m venv .venv && touch requirements.txt"
alias drpv="source ./.venv/bin/activate"

# [python.pip]
alias pipr="pip install -r requirement.txt"
alias pipf="pip freeze > requirement.txt"

# [ssh]
config_git_ssh() {
    ssh-keygen -t ed25519 -C $1
    eval "$(ssh-agent -s)"
    ssh-add $HOME/.ssh/id_ed25519
}

# [xorg]
alias list_window="wmctrl -lx"

# [curl]
curl-file() {
    curl --output $1 $2
}
