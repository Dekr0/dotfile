# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dekr0/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/dekr0/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/.config/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${HOME}/.config/fzf/key-bindings.zsh"
