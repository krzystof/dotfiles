#!/usr/bin/env bash
set -e

DOTFILES=$(pwd)
release=`lsb_release -cs`

. ./prompt_utils.sh
. ./helpers.sh

e_header "Let's setup a new machine with Elementary OS, shall we"
echo
cd ${HOME}/Dotfiles

e_arrow "Updating the Dotfiles repo..."
git pull

sudo apt-get update &> /dev/null
apt_install software-properties-common

add_ppa jonathonf/vim
add_ppa mozillateam/firefox-next
add_ppa hnakamur/tmux

sudo apt-get update &> /dev/null

apt_install vim
apt_install zsh
apt_install xcape
apt_install firefox
apt_install gdebi
apt_install tmux
apt_install libevent-dev
apt_install terminator
apt_install silversearcher-ag
apt_install network-manager
apt_install libnss3-tools
apt_install jq
apt_install xsel

clone_github_repo ryanoasis/nerd-fonts nerd-fonts
clone_github_repo sorin-ionescu/prezto prezto

if [ ! -L ${HOME}/.zprezto ]; then
  ln -s ${DOTFILES}/repos/prezto ${HOME}/.zprezto
  e_ok "Symlinked prezto dir"
else
  e_arrow "Prezto dir is symlinked"
fi

if [ ! -f ${DOTFILES}/repos/prezto/modules/prompt/functions/prompt_polly_setup ]; then
  ln -s ${DOTFILES}/files/prompt_polly_setup  ${DOTFILES}/repos/prezto/modules/prompt/functions/prompt_polly_setup
  e_ok "Symlinked prezto prompt"
else
  e_arrow "Already using the proper prompt"
fi

install_nerd_font SauceCodePro
install_nerd_font Inconsolata

if ! type_exists dropbox; then
  e_arrow "installing dropbox"
  cd ${HOME}/Downloads
  wget -O dropbox_2015.10.28_amd64.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb
  sudo gdebi -q dropbox_2015.10.28_amd64.deb
  rm -f dropbox_2015.10.28_amd64.deb
  e_ok "dropbox installed, just login"
  seek_confirmation "is it synced yet?"
  if ! is_confirmed; then
    e_error "dropbox not synced yet! Please sign in and rerun this script after"
    exit 1
  fi
else
  e_arrow "Dropbox is there"
fi

if [ ! -d ${HOME}/Dropbox/Clementine ]; then
  e_error "Dropbox not synced yet! Please sign in and rerun this script after"
  exit 1
else
  e_arrow "Dropbox synced and ready"
fi

if ! type_exists clementine; then
  e_arrow "installing clementine"
  cd "${HOME}/Downloads"
  wget https://github.com/clementine-player/Clementine/releases/download/1.3.1/clementine_1.3.1-xenial_amd64.deb
  sudo gdebi clementine_1.3.1-xenial_amd64.deb
  rm -f clementine_1.3.1-xenial_amd64.deb
  e_ok "clementine installed"
else
  e_arrow "Clementine ready"
fi

mkdir -p ${HOME}/.config/Clementine

symlink_dropbox Clementine/albumcovers .config/Clementine/albumcovers
symlink_dropbox Clementine/Clementine.conf .config/Clementine/Clementine.conf
symlink_dropbox Clementine/clementine.db .config/Clementine/clementine.db

if [ ! -e ${HOME}/.vim ]; then
  ln -s ${HOME}/Dotfiles/vim ${HOME}/.vim
  e_ok "vim dir ready"
else
  e_arrow "Vim dir ready"
fi


symlinks=(zlogin zlogout zpreztorc zprofile zshenv zshrc tmux.conf gitconfig gitignore_global xprofile ctags)

for symlink in "${symlinks[@]}"; do
  if [ ! -L ${HOME}/.${symlink} ]; then
    ln -s ${DOTFILES}/files/${symlink} ${HOME}/.${symlink}
    e_ok "symlinked ${symlink}"
  else
    e_arrow "${symlink} symlink: OK"
  fi
done

mkdir -p ${HOME}/.zsh

if [ ! -L "${HOME}/.zsh/completion" ]; then
  ln -s "${DOTFILES}/completion" "${HOME}/.zsh/completion"
  e_ok "Symlinked zsh completion"
else
  e_arrow "Zsh completion is set up"
fi

if [ `echo $SHELL` != /bin/zsh ]; then
  chsh -s /bin/zsh
  e_ok "Changed default shell to zsh"
else
  e_arrow "Zsh is the default shell"
fi

mkdir -p ${HOME}/.config/terminator

if [ ! -L "${HOME}/.config/terminator/config" ]; then
  ln -fs ${DOTFILES}/files/terminator ${HOME}/.config/terminator/config
  e_ok "Terminator config symlinked"
else
  e_arrow "terminator config: OK"
fi

if ! type_exists albert; then
  cd "${DOTFILES}"
  e_arrow "installing albert"
  wget -nv -O Release.key \
    https://build.opensuse.org/projects/home:manuelschneid3r/public_key
  sudo apt-key add - < Release.key
  rm -f Release.key
  sudo apt-get update
  sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/albert.list"
  sudo apt-get update && apt_install albert
  mkdir -p "${HOME}/.config/albert/org.albert.extension.kvstore"
  ln -s "${HOME}/Dropbox/AlbertKeyValues/kvstore.db" "${HOME}/.config/albert/org.albert.extension.kvstore/kvstore.db"
  e_ok "albert installed"
else
  e_arrow "Albert set up"
fi

if [ ! -d ${NVM_DIR} ]; then
  sudo apt-get remove nodejs
  e_arrow "installing nvm"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
  # sed '/$NVM_DIR/nvm.sh/d' ${HOME}/.zshrc
  . "$NVM_DIR/nvm.sh"
  e_arrow "installing node"
  nvm install v8.1.3
  echo fs.inotify.max_user_watches=582222 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
  e_ok "nvm and node installed successfully"
else
  e_arrow "Nvm is set up"
fi

if ! type_exists yarn; then
  e_arrow "installing yarn"
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update && sudo apt-get install -y yarn
  e_ok "yarn installed successfully"
else
  e_arrow "Yarn is set up"
fi

if ! type_exists docker; then
  e_arrow "installing docker"
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository -y \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
  sudo apt-get update && apt_install docker-ce
  if ! grep -q docker /etc/group; then
    sudo groupadd docker
  fi
  sudo usermod -aG docker $USER
  sudo systemctl enable docker
  e_arrow "installing docker-compose"
  sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  e_ok "docker installed successfully"
else
  e_arrow "docker: OK"
fi

if ! type_exists php; then
  e_arrow "installing php7.2"
  add_ppa ondrej/php
  sudo apt-get update && sudo apt-get install -y php7.2-cli php7.2-pdo php7.2-xml php7.2-curl php7.2-dom php7.2-gd php7.2-mbstring php7.2-zip
  e_ok "php7.2: installed"
else
  e_arrow "php7.2: OK"
fi

if ! type_exists composer; then
  e_arrow "installing composer"
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified';  } else { echo 'Installer corrupt'; unlink('composer-setup.php');  } echo PHP_EOL;"
  php composer-setup.php
  php -r "unlink('composer-setup.php');"
  sudo mv composer.phar /usr/local/bin/composer
  e_ok "composer installed"
else
  e_arrow "Composer is set up"
fi

if ! type_exists valet; then
  e_arrow "installing valet"
  composer global require cpriego/valet-linux
  valet install
  valet domain wip
  cd "${HOME}/Code"
  valet park
  e_ok "valet: installed"
else
  e_arrow "valet: OK"
fi

# add_ppa philip.scott/elementary-tweaks
# sudo apt-get update && apt_install elementary-tweaks

if [ ! -d ${HOME}/.rbenv ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  rbenv init
  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
else
  e_arrow "rbenv: OK"
fi

# What needs to be done on a brand new system?
# - install elm
# - install elixir
# symlinks:
# dconf
# elementary tweaks
# maybe sublime?



gem install tmuxinator
ln -s ~/Dropbox/Tmuxinator ~/.config/tmuxinator
