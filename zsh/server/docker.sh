#!/bin/bash

set -ex

install_debian() {
    echo "Removing all old docker related packages..."
    for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
        sudo apt-get remove $pkg
    done
    echo "Removed all old docker related packages"

    echo "Adding Docker's official GPG key..."
    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo "Added Docker's official GPG key..."

    echo "Adding Docker's repository Apt sources..."
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    echo "Added Docker's repository Apt sources..."

    echo "Installing Docker..."
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    echo "Installed Docker"

    echo "Proceed to setup Rootless Docker"

    echo "Installing necessary packages on Debian for Rootless Docker..."
    sudo apt-get uidmap
    sudo apt-get install -y dbus-user-session fuse-overlayfs slirp4netns
    echo "Installed necessary packages on Debian for Rootless Docker..."

    echo "Temporary Docker shutdown"
    sudo systemctl disable --now docker.service docker.socket
    sudo rm /var/run/docker.sock

    echo "Running Docker Rootless setup tool..."
    dockerd-rootless-setuptool.sh install
    echo "Docker rootless setup tool complete"

    echo "Exporting necessary environmental variable. NOTICE: Only persist in the current shell session"
    export PATH=/usr/bin:$PATH
    export DOCKER_HOST=unix:///run/user/1000/docker.sock

    echo "Setting up and starting Docker daemon in user mode..."
    systemctl --user start docker
    systemctl --user enable docker
    sudo loginctl enable-linger $(whoami)
    echo "Started Docker daemon in user mode"

    echo "Switch to Docker Rootless as Default. NOTICE: Only persist in the current shell session"
    export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
}
