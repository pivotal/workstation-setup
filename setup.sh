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

source ${WORKSTATION_SETUP_HOME}/_init.sh

SKIP_ANALYTICS=${SKIP_ANALYTICS:-0}
if (( SKIP_ANALYTICS == 0 )); then
    clientID=$(od -vAn -N4 -tx  < /dev/urandom)
    source ${WORKSTATION_SETUP_HOME}/scripts/helpers/google-analytics.sh ${clientID} start $@
else
    export HOMEBREW_NO_ANALYTICS=1
fi

source ${WORKSTATION_SETUP_HOME}/base_setup.sh
${WORKSTATION_SETUP_HOME}/add_setup.sh "$@"

source ${WORKSTATION_SETUP_HOME}/scripts/common/finished.sh
if (( SKIP_ANALYTICS == 0 )); then
    source ${WORKSTATION_SETUP_HOME}/scripts/helpers/google-analytics.sh ${clientID} finish $@
fi
