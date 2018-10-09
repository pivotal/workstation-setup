#!/usr/bin/env bash

# Don't stop if install fails
set +e
echo
echo "Installing Wireshark"
brew cask install wireshark
set -e
