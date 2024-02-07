# partition mounting
#
mssd() {
    sudo mount -t ntfs-3g "$1" /mnt/win
}

alias me="sudo ntfs-3g /dev/sda1 /mnt/windows/E"
alias mf="sudo ntfs-3g /dev/sda2 /mnt/windows/F"
alias mg="sudo ntfs-3g /dev/sda3 /mnt/windows/G"
alias md="sudo ntfs-3g /dev/nvme0n1p6 /mnt/windows/D"
alias mb="sudo mount /dev/sdc1 /mnt/backup"
alias ue="sudo umount /mnt/windows/E"
alias uf="sudo umount /mnt/windows/F"
alias ug="sudo umount /mnt/windows/G"
alias ub="sudo umount /mnt/backup"
