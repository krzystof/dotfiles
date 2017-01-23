#!/bin/sh
# set -e
. $DOT_DIR/utils.sh

msg_info "Setting up Prezto"

if [ ! -d "$HOME/.zprezto" ] ; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" > > /dev/null
fi

cd $HOME/.zprezto
git pull > /dev/null

THEME="$HOME/.zprezto/modules/prompt/functions/prompt_ollie_setup"

if [ ! -L $THEME ] ; then
    ln -s $DOT_DIR/files/ollie-theme $THEME
fi
