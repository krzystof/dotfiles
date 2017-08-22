#!/usr/bin/env sh
set -eu

. ./prompt_utils.sh
. ./dot_helpers.sh

e_header "Hang tight"



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
