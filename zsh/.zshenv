# [Put the following in the home directory .zshenv]
# export XDG_CONFIG_HOME="$HOME/.config"
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# source $XDG_CONFIG_HOME/zsh/.zshenv

# [terminal_color]
export COLORTERM=truecolor

# [default applications]
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/chromium

# [history_file]
export HISTFILE=~/.histfile
export HISTSIZE=1000

# [PATH] 

# [PATH.dotfile]
export DOTFILE=$HOME/repo/dotfile
export PKG_LIST_HOME=$DOTFILE/packages

# [PATH.local]
export LOCAL=$HOME/.local
export LOCAL_BIN=$LOCAL/bin
PATH=$PATH:$LOCAL_BIN

# [PATH.go]
export GOPATH=$HOME/go
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:$GOPATH/bin

# [PATH.rust]
PATH=$PATH:$HOME/.cargo/bin

# [PATH.lsp_server]
PATH=$PATH:$LOCAL/lsp/lua/bin
PATH=$PATH:$LOCAL/lsp/clangd/bin
