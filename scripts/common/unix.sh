#!/usr/bin/env bash
source scripts/helpers/brew.sh

echo
echo "Installing utilities for unix development"

# For users of unixes
brew_install_if_missing pstree

# For developers of shell scripts
brew_install_if_missing jq
