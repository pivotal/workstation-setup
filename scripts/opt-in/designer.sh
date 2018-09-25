#!/usr/bin/env bash

# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing Designer applications"

# Graphic editing tools

brew_cask_install_if_missing adobe-creative-cloud
brew_cask_install_if_missing sketch

# Screen recording tools

brew_cask_install_if_missing recordit
brew_cask_install_if_missing skitch
brew_cask_install_if_missing licecap
brew_cask_install_if_missing screenflow

set -e
