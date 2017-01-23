#!/bin/sh
set -e

. $DOT_DIR/utils.sh

msg_info "Symlinking to the dotfiles"

symlink() {
    DEST="$DOT_DIR/files/$1"
    LINK="$HOME/.$1"

    # if file exist but not a symlink
    if [ -f $LINK ] && [ ! -L $LINK ] ; then
        rm -f $LINK
    fi

    # if symlink exist but not correct destination
    if [ -L $LINK ] && [ ! $(readlink $LINK) = $DEST ] ; then
        unlink $LINK
    fi

    # symlink if not exists
    if [ ! -L $LINK ] ; then
        ln -s $DEST $LINK
    fi
}

symlink "vimrc"
symlink "vim"
# symlink_in_dropbox "Prezto/zlogin" ".zlogin"
# symlink_in_dropbox "Prezto/logout" ".logout"
# symlink_in_dropbox "Prezto/zpreztorc" ".zpreztorc"
# symlink_in_dropbox "Prezto/zprofile" ".zprofile"
# symlink_in_dropbox "Prezto/zshenv" ".zshenv"
# symlink_in_dropbox "Prezto/zshrc" ".zshrc"
