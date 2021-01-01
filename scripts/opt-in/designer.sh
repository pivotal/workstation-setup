#!/usr/bin/env bash

# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing Designer applications"

# Graphic editing tools

brew install --cask adobe-creative-cloud
brew install --cask sketch

# Screen recording tools

brew install --cask recordit
brew install --cask skitch
brew install --cask licecap
brew install --cask screenflow

set -e
