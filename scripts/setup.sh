#!/usr/bin/env bash

# Fail immediately if any errors occur
set -e

echo "Caching password..."
sudo -K
sudo true;

SETUP_TYPE=$1
MY_DIR="$(dirname "$0")"

clear

echo
echo "Setting up a '$SETUP_TYPE' machine..."

# Note: Homebrew needs to be set up first
source ${MY_DIR}/homebrew.sh

# Place any applications that require the user to type in their password here
brew tap caskroom/cask
brew cask install github
brew cask install virtualbox
brew cask install zoomus

source ${MY_DIR}/configuration-bash.sh
source ${MY_DIR}/git.sh
source ${MY_DIR}/git-aliases.sh
source ${MY_DIR}/cloud-foundry.sh
source ${MY_DIR}/applications-common.sh
source ${MY_DIR}/configuration-osx.sh
source ${MY_DIR}/configurations.sh

if [ "${SETUP_TYPE}" == "labs-engineer" ]
then
  source ${MY_DIR}/applications-labs-engineer.sh
fi

if [ "${SETUP_TYPE}" == "designer" ]
then
  source ${MY_DIR}/applications-designer.sh
fi

if [ "${SETUP_TYPE}" == "data-engineer" ]
then
  source ${MY_DIR}/applications-data-engineer.sh
fi

source ${MY_DIR}/java.sh

source ${MY_DIR}/finished.sh
