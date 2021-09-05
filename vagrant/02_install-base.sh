#!/usr/bin/env bash
set -ex pipefail

apt-get -y install \
  cargo \
  libssl-dev \
  pkg-config \
  vim \
  autojump \
  grc \
  coreutils \
  watch \
  silversearcher-ag \
  bat \
  htop \
  zoxide \
  httpie \
  wget \
  jq \
  direnv \
  sudo \
  curl \
  file \
  git \
  build-essential \
  zsh-autosuggestions \
  snapd \
  zoxide

snap install --classic \
  intellij-idea-ultimate \
  lsd \
  dog \
  pycharm-professional




