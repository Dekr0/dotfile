stage_dotfile() {
    cd $DOTFILE
    git co Linux
    yes | cp -r $XDG_CONFIG_HOME/kitty $DOTFILE
    echo
    yes | cp -r $XDG_CONFIG_HOME/nvim $DOTFILE
    echo
    yes | cp -r $XDG_CONFIG_HOME/rofi $DOTFILE
    echo
    yes | cp -r $XDG_CONFIG_HOME/zsh $DOTFILE
    echo
    yes | cp -r $XDG_CONFIG_HOME/theme $DOTFILE
    echo
    yes | cp $XDG_CONFIG_HOME/zsh_keybind $DOTFILE
    echo
    yes | cp $HOME/.gitconfig $DOTFILE
    echo
    yes | cp $HOME/.shutil.json $DOTFILE
    echo
    yes | cp $HOME/.wezterm.lua $DOTFILE
    echo
    yes | cp $HOME/.xinitrc $DOTFILE
    echo
    yes | cp $HOME/.zshenv $DOTFILE
    echo
    rm $DOTFILE/zsh/.zcompdump
    rm $DOTFILE/nvim/lazy-lock.json
}

deploy_dotfile() {
    export XDG_CONFIG_HOME=$HOME/.config
    if [ ! -d $XDG_CONFIG_HOME ]; then
        mkdir $XDG_CONFIG_HOME
    fi

    yes | cp -r kitty $XDG_CONFIG_HOME
    echo
    yes | cp -r nvim $XDG_CONFIG_HOME
    echo
    yes | cp -r rofi $XDG_CONFIG_HOME
    echo
    yes | cp -r zsh $XDG_CONFIG_HOME
    echo
    yes | cp .gitconfig $HOME
    echo
    yes | cp .shutil.json $DOTFILE
    echo
    yes | cp .wezterm.lua $DOTFILE
    echo
    yes | cp .xinitrc $HOME
    echo
    yes | cp .zshenv $HOME
    echo
}

xssh_keygen() {
    ssh-keygen -t ed25519 -C $1
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_ed25519
}
