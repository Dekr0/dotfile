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

# [gcc]
gcc_strict() {
    gcc -std=c99 -Wall -Werror \
        -Wfloat-equal \
        -Wundef \
        -Wshadow \
        -Wpointer-arith \
        -Wcast-align \
        -Wstrict-overflow=5 \
        -Wwrite-strings \
        -Wcast-qual \
        -Wswitch-default \
        -Wswitch-enum \
        -Wconversion \
        -Wunreachable-code \
        "$@"
}

# [odin]
odin_build_debug() {
    odin build $1 -debug -out:$2
}

odin_build_test_debug() {
    odin build $1 -build-mode:test -debug -out:$2
}

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

# [TODO listing]
alias todo="nvim ${TODO}"

# [Notes]
alias note="nvim ${NOTE}"
