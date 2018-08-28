#!/bin/sh

brew_install_if_missing() {
  brew install $1 || true
}
