function add_ppa() {
  ppa=$1
  if ! grep -q "^deb .*${ppa}" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    sudo add-apt-repository -y ppa:${ppa} &> /dev/null
    e_ok "${ppa} ppa added"
  else
    e_arrow "${ppa} ppa: OK"
  fi
}

function apt_install() {
  pkg=$1
  if [[ ! `dpkg -l ${pkg}` ]]; then
    e_arrow "Installing ${pkg}"
    sudo apt-get install -y ${pkg} &> /dev/null
    e_ok "${pkg}: installed"
  else
    e_arrow "${pkg} apt: OK"
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
    e_arrow "installing nerd font ${1}"
    ./nerd-fonts/install.sh $1
    e_ok "${1} font installed"
  else
    e_arrow "Nerd font ${1} is there"
  fi
}
