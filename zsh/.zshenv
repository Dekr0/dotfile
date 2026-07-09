# [Put the following in the home directory .zshenv]
# export XDG_CONFIG_HOME="$HOME/.config"
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# source $XDG_CONFIG_HOME/zsh/.zshenv

# [terminal_color]
export COLORTERM=truecolor

# [TODO]
export TODO=~/repo/Dekr0

# [Notes]
export NOTE=~/repo/notes

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

# [PATH.bun]
# export BUN_INSTALL=$HOME/.bun
# PATH=$PATH:$BUN_INSTALL/bin

# [PATH.local]
export LOCAL=$HOME/.local
export LOCAL_BIN=$LOCAL/bin
export LOCAL_DOC=$LOCAL/doc
export LOCAL_MAN=$LOCAL/man
export LOCAL_XDG_DATA=$LOCAL/share
PATH=$PATH:$LOCAL:$LOCAL_BIN:$LOCAL_DOC:$LOCAL_MAN:$LOCAL_XDG_DATA

# [PATH.lib]
export LOCAL_LIB=$LOCAL/lib
export LOCAL_LUA_51_LIB=$LOCAL_LIB/lua/5.1
PATH=$PATH:$LOCAL_LIB
PATH=$PATH:$LOCAL_LUA_51_LIB

# [PATH.PKG_CONFIG_PATH]
# export PKG_CONFIG_PATH=$LOCAL_LIB/pkgconfig

# [PATH]
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LOCAL_LIB

# [PATH.lsp_server]
export LSP=$LOCAL_BIN/lsp
PATH=$PATH:$LSP

# [PATH.dotnet]
export DOTNET_ROOT=$LOCAL/share/dotnet
PATH=$PATH:$DOTNET_ROOT
PATH=$PATH:$HOME/.dotnet

# [PATH.go]
export GOPATH=$LOCAL/gopath
PATH=$PATH:$LOCAL/go/bin:$GOPATH:$GOPATH/bin

# [PATH.lua_ls]
PATH=$PATH:$LSP/lua_ls/bin

# [PATH.nvim]
export NVIM=$XDG_CONFIG_HOME/nvim/lua

# [PATH.rust]
PATH=$PATH:$HOME/.cargo/bin

# [PATH.odin]
PATH=$PATH:$LOCAL/odin
PATH=$PATH:$LSP/ols

# [PATH.zig]
PATH=$PATH:$LOCAL/zig/0.17.0

windows() {
    export HD2DATA="/mnt/d/Program Files/Steam/steamapps/common/Helldivers 2/data"
    export WINHOME="/mnt/c/Users/Dekr0"
}
. "$HOME/.cargo/env"
