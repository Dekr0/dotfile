# [zsh only]
zle     -N            fdb
bindkey -M emacs '^J' fdb 
bindkey -M vicmd '^J' fdb 
bindkey -M viins '^J' fdb 

zle     -N              fdb_kitty
bindkey -M emacs '^[^J' fdb_kitty 
bindkey -M vicmd '^[^J' fdb_kitty 
bindkey -M viins '^[^J' fdb_kitty 

zle     -N              kitty_tab_fzf
bindkey -M emacs '^[^F' kitty_tab_fzf 
bindkey -M vicmd '^[^F' kitty_tab_fzf 
bindkey -M viins '^[^F' kitty_tab_fzf 
