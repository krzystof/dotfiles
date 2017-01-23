#!/bin/sh
set -e
. ./utils.sh

msg_info "Updating packages list"

sudo apt-get update > /dev/null

install() {
    if ! command -v $1 > /dev/null; then
        msg_info "Installing $1"
        sudo apt-get install $1
    fi
}

install "zsh"
install "vim"
