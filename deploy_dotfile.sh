deploy_dotfile() {
    if [ ! -d $XDG_CONFIG_HOME ]; then
        mkdir $XDG_CONFIG_HOME
    fi

    yes | cp -r kitty $XDG_CONFIG_HOME
    yes | cp -r rofi $XDG_CONFIG_HOME
    yes | cp -r zsh $XDG_CONFIG_HOME
    yes | cp .gitconfig $HOME
    yes | cp .xinitrc $HOME
    yes | cp .zshenv $HOME
}
