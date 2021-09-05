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
  snapd

snap install intellij-idea-ultimate --classic




