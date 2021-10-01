#!/usr/bin/env bash
#
# setup.sh:  run the workstation setup
#
# Arguments:
#   - a list of components to install, see scripts/opt-in/ for valid options
#
# Environment variables:
#   - SKIP_ANALYTICS:  Set this to 1 to not send usage data to our Google Analytics account
#

# Fail immediately if any errors occur

WORK_DIR="$(dirname "$0")"

# Ask for the administrator password upfront
sudo -v

# Keep sudo alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Note: Homebrew needs to be set up first
source ${WORK_DIR}/scripts/common/homebrew.sh
# Install everything else
source ${WORK_DIR}/scripts/common/oh-my-zsh.sh
source ${WORK_DIR}/scripts/common/editors.sh
source ${WORK_DIR}/scripts/common/git.sh
source ${WORK_DIR}/scripts/common/git-aliases.sh
source ${WORK_DIR}/scripts/common/developer-utilities.sh
source ${WORK_DIR}/scripts/common/vim-configurations.sh
source ${WORK_DIR}/scripts/common/applications-common.sh
source ${WORK_DIR}/scripts/common/unix.sh

# make macOs config optional
read -r -p "Do you want to update Mac OS settings? (y/n default)" OS_SETTINGS
if [[ $OS_SETTINGS == "y" ]]
then
  source ${WORK_DIR}/scripts/common/configuration-osx.sh
fi
echo

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

# For each command line argument, try executing the corresponding script in custom/
for var in "$@"
do
    echo "$var"
    FILE=${WORK_DIR}/scripts/custom/${var}.sh
    echo "$FILE"
    if [ -f $FILE ]; then
        source ${FILE}
    else
       echo "Warning: $var does not appear to be a valid argument. File $FILE does not exist."
    fi
done


source ${WORK_DIR}/scripts/common/finished.sh
