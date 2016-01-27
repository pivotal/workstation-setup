#!/usr/bin/env bash

# Fail immediately if any errors occur
set -e

clear

echo
echo "Ensuring your Homebrew directory is writeable..."
sudo chown -R $(whoami) /usr/local/bin

brew prune

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
