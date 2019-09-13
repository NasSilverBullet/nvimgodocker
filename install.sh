#!/bin/bash

function add_dependencies() {
  apk update
  apk upgrade
  apk add --no-cache \
	git \
  curl \
  make \
  gcc \
  musl-dev \
  musl \
  linux-headers \
  gcc \
  g++ \
  gfortran \
  openblas-dev \
  python2 \
  python3 \
  python-dev \
  python3-dev \
  py2-pip \
  py3-pip \
  ruby \
  ruby-dev \
  ruby-rdoc \
  nodejs \
  npm \
  neovim \
  neovim-doc
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

function curl_nvim_config_files() {
  mkdir -p ~/.config/nvim
  cd ~/.config/nvim

  curl -L -O https://raw.githubusercontent.com/NasSilverBullet/nvimgodocker/master/nvim/init.vim

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

add_dependencies
install_providers
install_dein
curl_nvim_config_files
install_nvim_plugins
exit 0
