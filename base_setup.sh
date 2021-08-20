#!/usr/bin/env sh
#
# base_setup.sh:  run only the initial RxRevu workstation setup.
# Should only need to be run once.

# Fail immediately if any errors occur
set -e

. _init.sh

# Note: Start by ensuring that homebrew is installed
. ${WORKSTATION_SETUP_HOME}/scripts/common/homebrew.sh

# Place any applications that require the user to type in their password here
brew install --cask github

. ${WORKSTATION_SETUP_HOME}/scripts/common/zsh-setup.sh
. ${WORKSTATION_SETUP_HOME}/scripts/common/oh-my-zsh.sh
. ${WORKSTATION_SETUP_HOME}/scripts/common/asdf.sh
. ${WORKSTATION_SETUP_HOME}/scripts/common/git.sh
. ${WORKSTATION_SETUP_HOME}/scripts/common/git-aliases.sh
. ${WORKSTATION_SETUP_HOME}/scripts/common/applications-common.sh
. ${WORKSTATION_SETUP_HOME}/scripts/common/unix.sh
. ${WORKSTATION_SETUP_HOME}/scripts/common/configuration-osx.sh
. ${WORKSTATION_SETUP_HOME}/scripts/common/configurations.sh
. ${WORKSTATION_SETUP_HOME}/scripts/common/redis.sh
