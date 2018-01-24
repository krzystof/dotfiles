function add_ppa() {
  ppa=$1
  if ! grep -q "^deb .*${ppa}" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    sudo add-apt-repository -y ppa:${ppa} &> /dev/null
    e_ok "${ppa} ppa added"
  fi
}

function apt_install() {
  pkg=$1
  if ! command -v ${pkg} &> /dev/null; then
    e_arrow "Installing ${pkg}"
    sudo apt-get install -y ${pkg} &> /dev/null
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
