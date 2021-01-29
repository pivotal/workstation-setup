#!/usr/bin/env bash
#
# setup.sh:  run the RxRevu workstation setup
#
# This script will run a full set up including both base set up and
# any additional components you specify. To add additional components
# later run the add_setup.sh script with a list of the components
# you are interested in (look at the scripts/opt-in directory to see
# what's available).
#
# Arguments:
#   - a list of components to install, see scripts/opt-in/ for valid options
#
# Environment variables:
#   - SKIP_ANALYTICS:  Set this to 1 to not send usage data to our Google Analytics account
#

# Fail immediately if any errors occur
set -e

source base_setup.sh
./add_setup.sh "$@"

source ${WORKSTATION_SETUP_HOME}/scripts/common/finished.sh
