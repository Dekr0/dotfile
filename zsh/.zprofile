eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/theme.omp.json)"

# sourcing
[ -f $z $ZDOTDIR/.alias.zsh ] && source $ZDOTDIR/.alias.zsh
[ -f $z $ZDOTDIR/.sync.zsh ] && source $ZDOTDIR/.sync.zsh
[ -f $z $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh
