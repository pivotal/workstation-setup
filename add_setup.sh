#!/usr/bin/env sh
#
# add_setup.sh:  run the RxRevu workstation setup
#
# Arguments:
#   - a list of components to install, see scripts/opt-in/ for valid options

# Fail immediately if any errors occur
#set -e

. ./_init.sh

# For each command line argument, try executing the corresponding script in opt-in/
for var in "$@"
do
    echo "$var"
    FILE=${WORKSTATION_SETUP_HOME}/scripts/opt-in/${var}.sh
    echo "$FILE"
    if [ -f $FILE ]; then
        /bin/bash ${FILE}
        exit_code=$?
        if [ $exit_code -ne 0 ]; then
            echo "*************************"
            echo "Failed to execute $var"
            echo "*************************"
            exit $exit_code
        fi
    else
       echo "Warning: $var does not appear to be a valid argument. File $FILE does not exist."
    fi
done
