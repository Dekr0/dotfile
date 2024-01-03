source $ZDOTDIR/.git.zsh
source $ZDOTDIR/.js.zsh
source $ZDOTDIR/.nnn.zsh
source $ZDOTDIR/.mount.zsh
source $ZDOTDIR/.python.zsh
source $ZDOTDIR/.go.zsh
source $ZDOTDIR/.pa.zsh
source /usr/share/nvm/init-nvm.sh

gdiscor() {
	sudo tar xzf $1 -C /opt
	sudo ln -s /opt/Discord/Discord /usr/bin/discord
}

fork() {
	(setsid "$@" &)
}

del() {
    mv "$1" ~/trash/
}

alias br="chromium"
alias cp="cp -i"                                                # Confirm before overwriting something
alias df="df -h"                                                # Human-readable sizes
alias free="free -m"                                            # Show sizes in MB
alias ld="lsblk -f"
alias shutdown="shutdown now"
alias wmname="wmname LG3D"

# ls
eval "$(dircolors -b)"
alias ls="ls --color=auto"
alias lsl="ls -l"
alias lsa="ls -la"

# b2
alias b2="b2-linux"

alias monitor-normal="xrandr --output HDMI-0 --rotate normal"
alias monitor-right="xrandr --output HDMI-0 --rotate right"

