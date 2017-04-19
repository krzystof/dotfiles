#!/bin/bash
set -eu

# Update the dotfiles repo
cd $HOME/Dotfiles
git pull
cd ~

# Delete some directories
function remove_music_if_exists() {
    DIR_TO_RM=$HOME/Music/$1
    if [[ -e "${DIR_TO_RM}" ]]; then
        rm -rf "${DIR_TO_RM}"
    fi
}

remove_music_if_exists "Von Bondies"
remove_music_if_exists "White_Stripes/Various_live"

