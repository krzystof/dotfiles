#!/bin/sh
set -e
export DOT_DIR="$(cd "$(dirname "$0")" && pwd)"

. $DOT_DIR/utils.sh

# elevate sudo privilege
# if [ ! "$UID" = 0 ] ; then
#     exec sudo bash "$0" "$@"
# fi

# ./tasks/update_repo.sh
# ./tasks/dropbox.sh
# ./tasks/apt_get.sh
# $DOT_DIR/tasks/symlinks.sh
# $DOT_DIR/tasks/setup_shell.sh
# $DOT_DIR/tasks/fonts.sh
$DOT_DIR/tasks/node.sh
# install nvm yarn and all
# colors
# sublime
# install docker and docker-compose
# setup my terminal

# msg_success "Finished!"
