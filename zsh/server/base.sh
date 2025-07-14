#!/bin/bash

set -ex

install_debian() {
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings

    sudo apt-get install git lf neovim ufw unzip uuid-runtime wget zip zsh

    echo "Removing default bash related profile"
    rm ~/.bashrc ~/.bash_logout ~/.profile

    echo "Setting up basic developer environment..."
    sudo chsh -s /bin/zsh $(whoami)

    mkdir $HOME/.config

    mkdir $HOME/.config/nvim
    # wget nvim config file used in the server

    # wget zsh config file used in the server
}

