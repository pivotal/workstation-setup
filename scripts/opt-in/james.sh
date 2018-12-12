#!/usr/bin/env bash
# Usage: ./scripts/opt-in/james.sh
# Don't stop if James' personal setup fails
set +e

source scripts/helpers/brew.sh

bundle config build.libxml-ruby --use-system-libraries=true --with-xml2-include=/usr/local/opt/libxml2/include/libxml2/

brew_install_if_missing mas
brew_cask_install_if_missing spotify
brew_cask_install_if_missing 1password

mas install 585829637     # Todoist.app
mas install 1091189122    # Bear.app

set -e
