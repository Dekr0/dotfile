config="${HOME}/.config"
codebase="${HOME}/codebase"
stage="${HOME}/repo/mine"
dotfile=(
#    "${config}/alacritty/alacritty.yml"
#    "${config}/nnn"
#    "${config}/nvim" 
#    "${config}/picom"
#    "${config}/rofi"
#    "${config}/theme.omp.json" 
    "${config}/zsh"
#    "${HOME}/.zshenv"
#    "${HOME}/.tmux.conf"
)

stage_zsh()
{
   if [[ -d ${HOME}/Trash/dotfile/zsh ]]; then
       if [[ "$2" == "y" ]]; then
       else
           rsync -av --progress $1 ${HOME}/Trash/dotfile/ --exclude cache --exclude .zcompdump
       fi
   else
       mkdir ${HOME}/Trash/dotfile/zsh
   fi
}

stage_dotfile()
{
    echo "Stage all(y/n)?"
    read force
    echo $force
    for c in ${dotfile[@]}; do
        if [[ -d $c ]]; then
            echo "$c is a dir"
            if [[ "$c" == *zsh ]]; then
                stage_zsh $c $force
            else
                if [[ "$force" == "y" ]]; then
                    \cp -rf $c ${HOME}/Trash/dotfile
                else
                    cp -r ${c} ${HOME}/Trash/dotfile
                fi
            fi
        elif [[ -f $c ]]; then
            echo "$c is a file"
            if [[ "$force" == "y" ]]; then
                \cp -f $c ${HOME}/Trash/dotfile
            else
                cp ${c} ${HOME}/Trash/dotfile
            fi
        fi
    done
}
