#!/usr/bin/env bash
#
# setup.sh:  run the Pivotal workstation setup
#
# Arguments:
#   - a list of components to install, see scripts/opt-in/ for valid options
#
# Environment variables:
#   - SKIP_ANALYTICS:  Set this to 1 to not send usuage data to our Google Analytics account 
#

# Fail immediately if any errors occur
set -e

echo "Caching password..."
sudo -K
sudo true;
clear

MY_DIR="$(dirname "$0")"
SKIP_ANALYTICS=${SKIP_ANALYTICS:-0}
if (( SKIP_ANALYTICS == 0 )); then
    clientID=$(od -vAn -N4 -tx  < /dev/urandom)
    source ${MY_DIR}/scripts/helpers/google-analytics.sh ${clientID} start $@
else
    export HOMEBREW_NO_ANALYTICS=1
fi

# Note: Homebrew needs to be set up first
source ${MY_DIR}/scripts/common/homebrew.sh
source ${MY_DIR}/scripts/common/configuration-bash.sh

# Place any applications that require the user to type in their password here
brew tap caskroom/cask
brew cask install github
brew cask install virtualbox
brew cask install zoomus

source ${MY_DIR}/scripts/common/git.sh
source ${MY_DIR}/scripts/common/git-aliases.sh
source ${MY_DIR}/scripts/common/cloud-foundry.sh
source ${MY_DIR}/scripts/common/applications-common.sh
source ${MY_DIR}/scripts/common/unix.sh
source ${MY_DIR}/scripts/common/configuration-osx.sh
source ${MY_DIR}/scripts/common/configurations.sh

# For each command line argument, try executing the corresponding script in opt-in/
for var in "$@"
do
    echo "$var"
    FILE=${MY_DIR}/scripts/opt-in/${var}.sh
    echo "$FILE"
    if [ -f $FILE ]; then
        source ${FILE}
    else
       echo "Warning: $var does not appear to be a valid argument. File $FILE does not exist."
    fi
done

source ${MY_DIR}/scripts/common/finished.sh
if (( SKIP_ANALYTICS == 0 )); then
    source ${MY_DIR}/scripts/helpers/google-analytics.sh ${clientID} finish $@
fi
