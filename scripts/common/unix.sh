#!/usr/bin/env bash

echo
echo "Installing utilities for unix development"

# For users of unixes
brew install wget
## Install a newer version of grep;
## Mac OS ships with an old, slower version
brew install grep

# For developers of shell scripts
brew install jq # JSON utility
