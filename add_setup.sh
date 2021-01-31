#!/usr/bin/env bash
#
# add_setup.sh:  run the RxRevu workstation setup
#
# Arguments:
#   - a list of components to install, see scripts/opt-in/ for valid options

# Fail immediately if any errors occur
set -e

source ${WORKSTATION_SETUP_HOME}/_init.sh

# For each command line argument, try executing the corresponding script in opt-in/
for var in "$@"
do
    echo "$var"
    FILE=${WORKSTATION_SETUP_HOME}/scripts/opt-in/${var}.sh
    echo "$FILE"
    if [ -f $FILE ]; then
        source ${FILE}
    else
       echo "Warning: $var does not appear to be a valid argument. File $FILE does not exist."
    fi
done
