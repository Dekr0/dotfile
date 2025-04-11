stage_dotfile() {
    cd $DOTFILE
    git co Arch-PC
    yes | cp -r $XDG_CONFIG_HOME/zsh $DOTFILE
    yes | cp -r $XDG_CONFIG_HOME/kitty $DOTFILE
    yes | cp -r $XDG_CONFIG_HOME/rofi $DOTFILE
    yes | cp -r $XDG_CONFIG_HOME/nvim $DOTFILE
    yes | cp $HOME/.xinitrc $DOTFILE
    yes | cp $HOME/.zshenv $DOTFILE
    yes | cp $HOME/.gitconfig $DOTFILE
    yes | cp $XDG_CONFIG_HOME/zsh_keybind $DOTFILE
    rm $DOTFILE/zsh/.zcompdump
    rm $DOTFILE/nvim/lazy-lock.json
}
