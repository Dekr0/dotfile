# alias
gdiscod() {
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
