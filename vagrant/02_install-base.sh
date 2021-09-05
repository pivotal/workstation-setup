#!/usr/bin/env bash
set -e pipefail

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
  zoxide \
  zip unzip \
  powerline \
  fonts-powerline

snap install lsd
snap install dog
snap install chromium
snap install intellij-idea-ultimate --classic
snap install pycharm-professional --classic
snap install sublime-text --classic
snap install postman
snap install code-insiders --classic
snap install node --classic


# containerisation / docker
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io

# install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
dpkg -i minikube_latest_amd64.deb

# terraform version management
TF_ENV_DIR=/usr/local/share/tfenv
git clone https://github.com/tfutils/tfenv.git "$TF_ENV_DIR"
ln -s "$TF_ENV_DIR"/bin/* /usr/local/bin




