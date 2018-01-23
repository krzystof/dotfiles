#!/usr/bin/env bash
set -e

DOTFILES=$(pwd)
release=`lsb_release -cs`

. ./prompt_utils.sh
. ./dot_helpers.sh

function add_ppa() {
  ppa=$1
  if ! grep -q "^deb .*${ppa}" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    sudo add-apt-repository -y ppa:${ppa}
    e_ok "${ppa} ppa added"
  fi
}

function apt_install() {
  pkg=$1
  if [ -v ${pkg} ]; then
    e_arrow "Installing ${pkg}"
    sudo apt-get install -y ${pkg}
    e_ok "${pkg} installed"
  fi
}

function symlink_dropbox() {
  dest=${HOME}/Dropbox/${1}
  link=${HOME}/$2

  if [ ! -L ${link} ] || [ `readlink ${link}` != $dest ]; then
    ln -s ${dest} ${link}
    e_ok "symlinked to Dropbox/${dest} created"
  fi
}

function clone_github_repo() {
  cd ${DOTFILES}/repos
  repo=git@github.com/${1}.git
  if [ ! -d ${DOTFILES}/repos/${2} ]; then
    e_arrow "cloning from ${repo}"
    git clone --recursive ${repo}
    e_ok "${1} cloned successfully"
  fi
}

function install_nerd_font() {
  font_dir=${HOME}/.local/share/fonts
  # mkdir -p ${font_dir}
  if [ -d ${font_dir}/${1} ]; then
    ./nerd-fonts/install.sh $1
  fi
}


##############################


e_header "Hang tight!"
echo
cd ${HOME}/Dotfiles
git pull

add_ppa jonathonf/vim
add_ppa me-davidsansome/clementine

# sudo apt-get update > /dev/null

apt_install vim
apt_install clementine
apt_install zsh

# clone_github_repo ryanoasis/nerd-fonts nerd-fonts
# clone_github_repo sorin-ionescu/prezto pezto

ln -s ${DOTFILES}/files/prompt_polly_setup  ${DOTFILES}/repos/prezto/modules/prompt/functions/prompt_polly_setup

install_nerd_font SauceCodePro


# install dropbox
# https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb
# gdebi

if [ ! -d ${HOME}/Dropbox/Clementine ]; then
  e_error "Dropbox not synced yet! Please sign in and rerun this script after"
  exit 1
fi

symlink_dropbox Clementine/albumcovers .config/Clementine/albumcovers
symlink_dropbox Clementine/Clementine.conf .config/Clementine/Clementine.conf
symlink_dropbox Clementine/clementine.db .config/Clementine/clementine.db

symlinks=(zlogin zlogout zpreztorc zshenv zshrc tmux.conf gitconfig gitignore_global xprofile ctags)

for symlink in "${symlinks[@]}"; do
  echo $symlink
done

if [ `echo $SHELL` != /bin/zsh ]; then
  chsh -s /bin/zsh
fi

# What needs to be done on a brand new system?
# - build tmux 2.6
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
# - install xcape
# - install firefox


#
# FONTS
#

# ensure_dir .fonts
# if [ ! -d $HOME/.fonts ]; then
#     mkdir $HOME/.fonts
# fi


# if [ ! -d $HOME/.fonts/SauceCodePro ]; then
#     e_arrow "Installing SauceCodePro"
#     mkdir $HOME/.fonts/SauceCodePro
#     cd $HOME/.fonts/SauceCodePro
#     wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/SauceCodePro.zip > /dev/null 2>&1
#     unzip SauceCodePro.zip > /dev/null 2>&1
#     rm -f SauceCodePro.zip
#     echo "\r"
#     e_success "SauceCodePro installed"
# else
#     e_ok "SauceCodePro is there"
# fi



# #
# # SYMLINKS
# #

# if [ ! -L ${HOME}/.ctags ]; then
#     ln -s ${DOTFILES}/files/ctagsrc ${HOME}/.ctags
#     e_success "ctags symlinked"
# fi
