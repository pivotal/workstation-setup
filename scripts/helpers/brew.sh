#!/bin/sh

brew_install_if_missing() {
  brew list | grep $1 || brew install $1
}

brew_cask_install_if_missing() {
  brew cask list | grep $1 || brew cask install $1
}
