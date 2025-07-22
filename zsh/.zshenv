# [Put the following in the home directory .zshenv]
# export XDG_CONFIG_HOME="$HOME/.config"
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# source $XDG_CONFIG_HOME/zsh/.zshenv

# [terminal_color]
export COLORTERM=truecolor

# [default applications]
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/chromium

# [docker]
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# [history_file]
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
setopt appendhistory

# [PATH] 

# [PATH.dotfile]
export DOTFILE=$HOME/repo/dotfile
export PKG_LIST_HOME=$DOTFILE/packages

# [PATH.local]
export LOCAL=$HOME/.local
export LOCAL_BIN=$LOCAL/bin
PATH=$PATH:$LOCAL_BIN
PATH=$PATH:$LSP

# [PATH.go]
export GOPATH=$HOME/go
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:$GOPATH/bin

# [PATH.rust]
PATH=$PATH:$HOME/.cargo/bin

# [PATH.lsp_server]
export LSP=$LOCAL/bin/lsp
PATH=$PATH:$LSP/lua-language-server/bin

# [blender]
PATH=$PATH:$LOCAL/bin/blender

# [PATH.development]
export WWISE_TELLER_INITIAL_DIR=$HOME/codebase/wwise-teller/tests/bnk

export HD2DATA=/mnt/d/Program Files/Steam/steamapps/common/Helldivers 2/data
