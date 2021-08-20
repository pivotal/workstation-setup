#!/usr/bin/env bash

echo
echo "Installing utilities for unix development"
brew install autojump
brew install grc
brew install coreutils
brew install watch
brew install pstree
brew install the_silver_searcher
brew tap cantino/mcfly
brew install mcfly # better shell history
brew install lsd # better ls
brew install bat # better cat
brew install delta # better diff
brew install dust # better du
brew install duf # better df
brew install broot # better file ops in directory
brew install fd # better find
brew install choose # better cut
brew install glances htop # better top
brew install dog
# for http scripting/testing
brew install xh
brew install httpie
brew install wget

# For developers of shell scripts
brew install jq # json parsing
brew install yq # yaml/xml parsing
