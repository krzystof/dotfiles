#!/bin/sh
set -e
. $DOT_DIR/utils.sh

msg_info "Updating Dotfiles repo"

cd $DOTFILES_DIR && git pull > /dev/null
