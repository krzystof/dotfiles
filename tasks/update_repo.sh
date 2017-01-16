#!/bin/sh
set -e
. ./colors_and_utils.sh

msg_info "Updating Dotfiles repo"

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $DOTFILES_DIR && git pull > /dev/null
