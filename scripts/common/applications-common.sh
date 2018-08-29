# All these applications are independent, so if one
# fails to install, don't stop.
source scripts/helpers/brew.sh

set +e

echo
echo "Installing applications"

# Utilities

brew_cask_install_if_missing flycut
brew_cask_install_if_missing shiftit
brew_cask_install_if_missing dash
brew_cask_install_if_missing postman
brew_install_if_missing the_silver_searcher

# Terminals

brew_cask_install_if_missing iterm2

# Browsers

brew_cask_install_if_missing google-chrome
brew_cask_install_if_missing firefox

# Communication

brew_cask_install_if_missing slack
brew_cask_install_if_missing keycastr

# Text Editors

brew_cask_install_if_missing macdown
brew_cask_install_if_missing sublime-text
brew_cask_install_if_missing textmate
brew_cask_install_if_missing macvim

set -e
