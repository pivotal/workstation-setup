#!/usr/bin/env bash

# Don't stop if install fails
set +e
echo
echo "Installing Meld"
brew cask install caskroom/cask/meld
brew install caskroom/cask/meld
set -e
