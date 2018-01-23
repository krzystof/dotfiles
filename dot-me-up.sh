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
    e_ok "Symlink to Dropbox/${dest}"
  fi
}

function clone_github_repo() {
  cd ${DOTFILES}/repos
  repo=https://github.com/${1}.git
  if [ ! -d ${DOTFILES}/repos/${2} ]; then
    e_arrow "cloning from ${repo}"
    git clone --recursive ${repo} &> /dev/null
    e_ok "${1} cloned successfully"
  fi
}

function install_nerd_font() {
  font_dir=${HOME}/.local/share/fonts
  mkdir -p ${font_dir}
  if [ -d ${font_dir}/${1} ]; then
    ./nerd-fonts/install.sh $1
  fi
}

##################################

e_header "Hang tight!"
echo
cd ${HOME}/Dotfiles

e_arrow "Updating the Dotfiles repo..."
git pull

add_ppa jonathonf/vim
add_ppa me-davidsansome/clementine
add_ppa mozillateam/firefox-next

# sudo apt-get update &> /dev/null

apt_install vim
apt_install clementine
apt_install zsh
apt_install xcape
apt_install firefox

clone_github_repo ryanoasis/nerd-fonts nerd-fonts
clone_github_repo sorin-ionescu/prezto prezto

if [ ! -f ${DOTFILES}/repos/prezto/modules/prompt/functions/prompt_polly_setup ]; then
  ln -s ${DOTFILES}/files/prompt_polly_setup  ${DOTFILES}/repos/prezto/modules/prompt/functions/prompt_polly_setup
  e_arrow "Symlinked prezto prompt"
fi

install_nerd_font SauceCodePro
install_nerd_font Inconsolata

# install dropbox
# https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb
# gdebi

if [ ! -d ${HOME}/Dropbox/Clementine ]; then
  e_error "dropbox not synced yet! Please sign in and rerun this script after"
  exit 1
fi

symlink_dropbox Clementine/albumcovers .config/Clementine/albumcovers
symlink_dropbox Clementine/Clementine.conf .config/Clementine/Clementine.conf
symlink_dropbox Clementine/clementine.db .config/Clementine/clementine.db

if [ ! -e ${HOME}/.vim ]; then
  ln -s ${HOME}/Dropbox/Vim ${HOME}/.vim
  e_ok "symlinked Vim dir"
fi

symlinks=(zlogin zlogout zpreztorc zprofile zshenv zshrc tmux.conf gitconfig gitignore_global xprofile ctags vimrc)

for symlink in "${symlinks[@]}"; do
  if [ ! -L ${HOME}/.${symlink} ]; then
    ln -s ${DOTFILES}/files/${symlink} ${HOME}/.${symlink}
    e_ok "symlinked ${symlink}"
  fi
done

if [ `echo $SHELL` != /bin/zsh ]; then
  chsh -s /bin/zsh
    e_ok "changed default shell to zsh"
fi

if [ ! -d ${HOME}/.local/share/icons/bridge ]; then
  mkdir -p ${HOME}/.local/share/icons
  cp -R ${DOTFILES}/files/bridge ${HOME}/.local/share/icons/
fi

if [ ! command -v tmux ]; then
  e_arrow "installing tmux 2.6"
  cd ${HOME}/Downloads
  wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz
  tar -zcvf tmux-2.6.tar.gz
  ./configure && make
  sudo make install
  e_ok "tmux installed"
fi

if [ ! command -v albert ]; then
  e_arrow "installing albert"
  wget -nv -O Release.key \
    https://build.opensuse.org/projects/home:manuelschneid3r/public_key
  sudo apt-key add - < Release.key
  sudo apt-get update
  sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/albert.list"
  # sudo apt-get update
  sudo apt-get install albert
  e_ok "albert installed"
fi

# What needs to be done on a brand new system?
# - install completion files
# - dconf? needed?
# - install nvm and yarn
# - install docker
# - install php
# - disable git checks and run vim PluginInstall
# - symlink albret key values
# - symlink completion dir

# symlinks:
# dconf
# terminator?
# elementary tweaks
# maybe sublime?
