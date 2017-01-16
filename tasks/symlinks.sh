#!/bin/sh
set -e

symlink_in_dropbox() {
    # if not exist or not specified location...
    DEST="$HOME/Dropbox/$1"
    LINK="$HOME/$2"

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

symlink_in_dropbox "Vim/vimrc" ".vimrc"
