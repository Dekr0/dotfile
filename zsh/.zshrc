source_dotfile() {
    local dotfile="${1:-}"
    [ -f $ZDOTDIR/$dotfile ] && source $ZDOTDIR/$dotfile
}

source_dotfile util.sh
source_dotfile alias.sh
source_dotfile bind.sh
source_dotfile curl.sh
source_dotfile dotfile.sh
source_dotfile fzf.sh
source_dotfile git.sh
source_dotfile nnn.sh
source_dotfile shutil.sh
source_dotfile ssh.sh
source_dotfile docker.sh

# [prompt_style]
PS1="%1d"$'\n'"> "

# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install
#
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dekr0/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Options
setopt correct            # Auto correct mistakes
setopt extendedglob       # Extended globbing. Allows using regular expressions with *
setopt nocaseglob         # Case insensitive globbing
setopt rcexpandparam      # Array expension with parameters
setopt nocheckjobs        # Don't warn about running processes when exiting
setopt numericglobsort    # Sort filenames numerically when it makes sense
setopt nobeep             # No beep
setopt appendhistory      # Immediately append history instead of overwriting
setopt histignorealldups  # If a new command is a duplicate, remove the older one
setopt autocd             # if only directory path is entered, cd there.
setopt inc_append_history # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace    # Don't save commands that start with space

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                        # automatically find new executables in path 

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# fnm
FNM_PATH="/home/dekr0/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/dekr0/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
