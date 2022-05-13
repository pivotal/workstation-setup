#!/bin/bash

# FZF is a command-line fuzzy finder that replaces reverse-i-search on ^r
# https://github.com/junegunn/fzf

echo "Installing fzf"
brew install fzf

echo "Configuring fzf"
eval "$(brew --prefix)/opt/fzf/install"