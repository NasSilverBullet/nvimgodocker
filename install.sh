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

install_dein() {
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein.sh
  sh ./dein.sh ~/.cache/dein
  rm -f dein.sh
}

add_dependencies
install_providers
install_dein
exit 0
