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
export NNN_BMS="j:${HOME}/work_codebase/dev/sourect/sourect-oms-odoo2/sourect-oms-odoo-addons/;k:${HOME}/work_codebase/dev/sourect/sourect-oms-odoo-addons/"
export LD_LIBRARY_PATH=/usr/lib
export SAVEHIST=1000
export W3MIMGDISPLAY="/usr/lib/w3m/w3mimgdisplay"
export GOPATH="$HOME/go"


PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$DOTNET:$DOTNET_ROOT:$DOTNET_ROOT/tools
PATH=$PATH:$BUN_INSTALL/bin
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:$GOPATH/bin
. "$HOME/.cargo/env"
