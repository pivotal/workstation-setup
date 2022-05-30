#!/usr/bin/env bash
#
# setup.sh:  run the workstation setup
#
# Arguments:
#   - a list of components to install, see scripts/opt-in/ for valid options
#   - --list to print out the available opt-ins
#
# Environment variables:
#   - SKIP_ANALYTICS:  Set this to 1 to not send usage data to our Google Analytics account
#

# Fail immediately if any errors occur
set -e

MY_DIR="$(dirname "$0")"
OPT_IN_FOLDER="${MY_DIR}/scripts/opt-in"

function has_param() {
    local flags="$1"
    shift 1 # pull the flags you're looking for out of the args list
    for flag in $flags; do
        for arg in $@; do
            if [[ $arg == "$flag" ]]; then
                return 0;
            fi
        done
    done
    return 1
}

function present_opt_ins() {
    shopt -s nullglob
    local optIns=($OPT_IN_FOLDER/*)
    shopt -u nullglob # Turn off nullglob to make sure it doesn't interfere with anything later

    for option in ${optIns[@]}; do
      echo $option | sed -e "s:\.sh$::" -e "s:${OPT_IN_FOLDER}/::"
    done
}

if has_param "--list" "$@"; then
    present_opt_ins
    exit
fi

echo "Caching password..."
sudo -K
sudo true;
clear

SKIP_ANALYTICS=${SKIP_ANALYTICS:-0}
if (( SKIP_ANALYTICS == 0 )); then
    clientID=$(od -vAn -N4 -tx  < /dev/urandom)
    source ${MY_DIR}/scripts/helpers/google-analytics.sh ${clientID} start $@
else
    export HOMEBREW_NO_ANALYTICS=1
fi

# Note: Homebrew needs to be set up first
source ${MY_DIR}/scripts/common/homebrew.sh

# Install everything else
source ${MY_DIR}/scripts/common/oh-my-zsh.sh
source ${MY_DIR}/scripts/common/editors.sh
source ${MY_DIR}/scripts/common/git.sh
source ${MY_DIR}/scripts/common/git-aliases.sh
source ${MY_DIR}/scripts/common/applications-common.sh
source ${MY_DIR}/scripts/common/developer-utilities.sh
source ${MY_DIR}/scripts/common/unix.sh
source ${MY_DIR}/scripts/common/configuration-osx.sh

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
