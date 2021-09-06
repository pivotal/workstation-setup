#!/usr/bin/env bash
#
# setup.sh:  run the Pivotal workstation setup
#
# Arguments:
#   - a list of components to install, see scripts/opt-in/ for valid options
#
# Environment variables:
#   - SKIP_ANALYTICS:  Set this to 1 to not send usage data to our Google Analytics account
#

# Fail immediately if any errors occur
set -e

WORK_DIR="$(dirname "$0")"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source "${WORK_DIR}"/scripts/common/homebrew.sh
source "${WORK_DIR}"/scripts/common/zsh.sh
source "${WORK_DIR}"/scripts/common/git.sh
source "${WORK_DIR}"/scripts/common/git-aliases.sh
source "${WORK_DIR}"/scripts/common/unix.sh

# make mac os configurations optional
echo
echo
read -r -p "Would you like to install common applications like browsers? (y/n default)" INSTALL_COMMON_APPS
if [[ $INSTALL_COMMON_APPS == "y" ]]
then
  source ${WORK_DIR}/scripts/common/applications-common.sh
fi

echo
echo

read -r -p "Do you want to update Mac OS settings? (y/n default)" OS_SETTINGS
if [[ $OS_SETTINGS == "y" ]]
then
  source ${WORK_DIR}/scripts/common/configuration-osx.sh
fi
echo

source ${WORK_DIR}/scripts/common/configurations.sh

# For each command line argument, try executing the corresponding script in opt-in/
for var in "$@"
do
    echo "$var"
    FILE=${WORK_DIR}/scripts/opt-in/${var}.sh
    echo "$FILE"
    if [ -f $FILE ]; then
        source ${FILE}
    else
       echo "Warning: $var does not appear to be a valid argument. File $FILE does not exist."
    fi
done

source ${WORK_DIR}/scripts/common/finished.sh
