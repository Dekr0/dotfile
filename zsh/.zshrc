# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
LD_LIBRARY_PATH=/usr/lib
SAVEHIST=1000
#W3MIMGDISPLAY="/usr/lib/w3m/w3mimgdisplay"

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/home/dekr0/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Options
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace                                          # Don't save commands that start with space

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Alias
#source "/home/dekr0/.config/alias"

# Posh
theme="my-blue-owl"
#eval "$(oh-my-posh init zsh --config /home/dekr0/.config/poshthemes/${theme}.omp.json)"

alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gb="git checkout"

# pnpm
#export PNPM_HOME="/home/dekr0/.local/share/pnpm"
#export USER_BIN="/home/dekr0/.local/bin/"
#export PATH="$USER_BIN:$PNPM_HOME:$PATH"
# pnpm end
