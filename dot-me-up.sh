#!/usr/bin/env sh
set -eu

DOTFILES=$(pwd)

. ./prompt_utils.sh
. ./dot_helpers.sh

e_header "Hang tight"



# What needs to be done on a brand new system?
# - add ppa for vim and tmux
# - install vim tmux terminator?
# - ppa + install Clementine + symlink db covers and conf
# - install zsh
# - set default shell
# - clone prezto
# - install completion files
# - symlink my custom theme
# - bridge cursor
# - dconf? needed?
# - install albert
# - install nvm and yarn
# - install docker
# - install php
# - get programmnig fonts
# - symlink zsh and vim stuff
# - disable git checks and run vim PluginInstall


#
# FONTS
#

if [ ! -d $HOME/.fonts ]; then
    mkdir $HOME/.fonts
fi

if [ ! -d $HOME/.fonts/SauceCodePro ]; then
    e_arrow "Installing SauceCodePro"
    mkdir $HOME/.fonts/SauceCodePro
    cd $HOME/.fonts/SauceCodePro
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/SauceCodePro.zip > /dev/null 2>&1
    unzip SauceCodePro.zip > /dev/null 2>&1
    rm -f SauceCodePro.zip
    echo "\r"
    e_success "SauceCodePro installed"
else
    e_ok "SauceCodePro is there"
fi



#
# SYMLINKS
#

if [ ! -L ${HOME}/.ctags ]; then
    ln -s ${DOTFILES}/files/ctagsrc ${HOME}/.ctags
    e_success "ctags symlinked"
fi
