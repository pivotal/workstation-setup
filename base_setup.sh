#!/usr/bin/env bash
#
# base_setup.sh:  run only the initial RxRevu workstation setup.
# Should only need to be run once.

# Fail immediately if any errors occur
set -e

source ${WORKSTATION_SETUP_HOME}/_init.sh

echo "Caching sudo password..."
sudo -K
sudo true;
clear

# Note: Homebrew needs to be set up first
source ${WORKSTATION_SETUP_HOME}/scripts/common/homebrew.sh
source ${WORKSTATION_SETUP_HOME}/scripts/common/configuration-bash.sh

# Place any applications that require the user to type in their password here
brew install --cask github
brew install --cask zoomus

source ${WORKSTATION_SETUP_HOME}/scripts/common/zprofile-setup.sh
source ${WORKSTATION_SETUP_HOME}/scripts/common/asdf.sh
source ${WORKSTATION_SETUP_HOME}/scripts/common/git.sh
source ${WORKSTATION_SETUP_HOME}/scripts/common/git-aliases.sh
source ${WORKSTATION_SETUP_HOME}/scripts/common/applications-common.sh
source ${WORKSTATION_SETUP_HOME}/scripts/common/unix.sh
source ${WORKSTATION_SETUP_HOME}/scripts/common/configuration-osx.sh
source ${WORKSTATION_SETUP_HOME}/scripts/common/configurations.sh
source ${WORKSTATION_SETUP_HOME}/scripts/common/redis.sh
