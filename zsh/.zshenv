export COLORTERM=truecolor
export DOTNET=/usr/share/dotnet
export DOTNET_ROOT=$HOME/.dotnet
export BUN_INSTALL="$HOME/.bun"
export EDITOR=/usr/bin/nvim
export HISTFILE=~/.histfile
export HISTSIZE=1000
export NNN_TERMINAL='alacritty'
export NNN_FCOLORS='c1e2f82e006033f7c6d6abc4'
export NNN_PLUG='p:preview-tui'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPT='-ePp'
export NNN_BMS="d:${HOME}/repo/mine/dotfile;c:${HOME}/.config"
export LD_LIBRARY_PATH=/usr/lib
export SAVEHIST=1000
export W3MIMGDISPLAY="/usr/lib/w3m/w3mimgdisplay"

. "$HOME/.cargo/env"

PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$DOTNET:$DOTNET_ROOT:$DOTNET_ROOT/tools
PATH=$PATH:$BUN_INSTALL/bin
PATH=$PATH:/usr/local/go/bin
