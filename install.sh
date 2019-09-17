#!/bin/bash

function add_dependencies() {
  echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

  apk update

  apk upgrade

  packages='
  g++
  gcc
  git
  curl
  make
  musl
  musl-dev
  gfortran
  openblas-dev
  linux-headers
  python2
  py2-pip
  python-dev
  python3
  py3-pip
  python3-dev
  ruby
  ruby-dev
  ruby-rdoc
  npm
  nodejs
  neovim
  neovim-doc
  ripgrep@testing
  '

  apk add --no-cache $packages
}

function install_providers() {
  pip install --upgrade pip
  pip install neovim

  pip3 install --upgrade pip3
  pip3 install neovim

  gem install neovim

  npm install --global neovim
}

function install_dein() {
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein.sh
  sh ./dein.sh ~/.cache/dein
  rm -f dein.sh
}

function get_nvim_config_files() {
  mkdir -p ~/.config/nvim
  cd ~/.config/nvim

  curl -L -O https://raw.githubusercontent.com/NasSilverBullet/nvimgodocker/master/nvim/init.vim
  curl -L -O https://raw.githubusercontent.com/NasSilverBullet/dotfiles/master/.config/nvim/config.vim

  files='
  dein
  denite
  deoplete
  lightline
  go_lazy
  md_lazy
  '

  for file in ${files}; do
    curl -L -O https://raw.githubusercontent.com/NasSilverBullet/dotfiles/master/.config/nvim/$file.toml
  done

  cd -
}

function install_nvim_plugins() {
  nvim --headless -c "call dein#install()" -c "q"

  nvim --headless -c "GoInstallBinaries" -c "q"

  # nvim --headless -c "UpdateRemotePlugins" -c "q"
  mkdir -p ~/.local/share/nvim
  cd ~/.local/share/nvim
  curl -L -O https://raw.githubusercontent.com/NasSilverBullet/nvimgodocker/master/nvim/rplugin.vim
  cd -
}

function echo_success_message() {
  echo "========================================="
  echo "all steps were completed successfully!!!!"
  echo "enjoy happiy hacking with nvim x vim-go!!"
  echo "========================================="
}

add_dependencies
install_providers
install_dein
get_nvim_config_files
install_nvim_plugins
echo_success_message
exit 0
