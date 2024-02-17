source $ZDOTDIR/.git.zsh
source $ZDOTDIR/.js.zsh
source $ZDOTDIR/.nnn.zsh
source $ZDOTDIR/.mount.zsh
source $ZDOTDIR/.python.zsh
source $ZDOTDIR/.go.zsh
source $ZDOTDIR/.pa.zsh
source $ZDOTDIR/.ssh.zsh

fork() {
	(setsid "$@" &)
}

del() {
    mv "$1" ~/trash/
}

alias cp="cp -i"                                                # Confirm before overwriting something
alias df="df -h"                                                # Human-readable sizes
alias free="free -m"                                            # Show sizes in MB
alias ld="lsblk -f"

# ls
eval "$(dircolors -b)"
alias ls="ls --color=auto"
alias lsl="ls -l"
alias lsa="ls -la"