# alias
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
alias nnn="nnn -eHPp"
alias shutdown="shutdown now"
alias wmname="wmname LG3D"
alias baro="~/codebase/barotrauma/game/Barotrauma"
alias devbaro="cd ~/codebase/barotrauma/Barotrauma/BarotraumaClient/ClientSource/"

# ls
eval "$(dircolors -b)"
alias ls="ls --color=auto"
alias lsl="ls -l"
alias lsa="ls -la"

# git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gb="git checkout"

# b2
alias b2="b2-linux"

# dual-boot desktop
mssd() {
    sudo mount -t ntfs-3g "$1" /mnt/win
}
alias me="sudo ntfs-3g /dev/sda1 /mnt/windows/E"
alias mf="sudo ntfs-3g /dev/sda2 /mnt/windows/F"
alias mg="sudo ntfs-3g /dev/sda3 /mnt/windows/G"
alias mb="sudo mount /dev/sdc1 /mnt/backup"
alias ue="sudo umount /mnt/windows/E"
alias uf="sudo umount /mnt/windows/F"
alias ug="sudo umount /mnt/windows/G"
alias ub="sudo umount /mnt/backup"
alias monitor-normal="xrandr --output HDMI-0 --rotate normal"
alias monitor-right="xrandr --output HDMI-0 --rotate right"

ts() {
        if [[ -a /usr/bin/yarn ]]
        then
            yarn add -D ts-node typescript @types/node
            yarn tsc --init
        elif [[ -a /usr/bin/node ]]
        then
            npm install --save-dev ts-node typescript @types/node
        else
            echo "Require npm / yarn"
        fi
}

tsc() {
    ts
    if [[ -a /usr/bin/yarn ]]
    then
        yarn add -D webpack webpack-cli
    elif [[ -a /usr/bin/node ]]
    then
        npm install --save-dev webpack webpack-cli
    else
        echo "Require npm / yarn"
    fi
}

n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn -eHPp "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}
