config="${HOME}/.config"
codebase="${HOME}/codebase"
mine="${HOME}/repo/mine"
dotfiles=(
    "${config}/alacritty/alacritty.yml"
    "${config}/nnn"
    "${config}/nvim" 
    "${config}/picom/picom.conf"
    "${config}/rofi"
    "${config}/theme.omp.json" 
    "${config}/zsh"
    "${HOME}/.zshenv"
    "${HOME}/.tmux.conf"
)

stage_zsh()
{
    if [[ ! -d ${mine}/dotfile/zsh ]]; then
        mkdir ${mine}/dotfile/zsh
    fi

    rsync -av --progress $1 ${mine}/dotfile/ --exclude cache --exclude .zcompdump
}

stage_nvim()
{
    if [[ ! -d ${mine}/dotfile/nvim ]]; then
        mkdir ${mine}/dotfile/nvim
    fi

    rsync -av --progress $1 ${mine}/dotfile/ --exclude="*.json"
}

stage_dotfiles()
{
    for c in ${dotfiles[@]}; do
        if [[ -d $c ]]; then
            if [[ "$c" == *zsh ]]; then
                stage_zsh $c
            elif [[ "$c" == *nvim ]]; then
                stage_nvim $c
            else
                \cp -rf $c ${mine}/dotfile
            fi
        elif [[ -f $c ]]; then
            \cp -f $c ${mine}/dotfile
        fi
    done

    cd $mine/dotfile
}
