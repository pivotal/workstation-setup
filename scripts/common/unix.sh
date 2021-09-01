#!/usr/bin/env bash

echo
echo "Installing utilities for unix development"

# Handy CLI tools
brew install autojump # navigation helper
brew install grc # colorize things
brew install coreutils # GNU core utilities
brew install watch # watch things
brew install direnv # unclutter your .profile

# For users of unixes
brew install pstree
brew install the_silver_searcher
brew install wget

# For developers of shell scripts
brew install jq # JSON utility
