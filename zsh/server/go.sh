#!/bin/bash

set -ex

install_debian() {
    wget https://go.dev/dl/go1.24.4.linux-amd64.tar.gz

    echo "Installing Golang"
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz
    rm go1.24.4.linux-amd64.tar.gz
    echo "Installed Golang"

    echo "Export Golang environmental variables. NOTICE: This only persist in the current session."
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:$HOME/go/bin

    echo "Installing useful golang packages"
    go install github.com/pressly/goose/v3/cmd/goose@latest
    go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest 
}
