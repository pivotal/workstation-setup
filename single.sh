#!/usr/bin/env bash
#
# single.sh:  run the Pivotal workstation setup
#
# Arguments:
#   - a list of files to execute with variables properly initialized
#

# Fail immediately if any errors occur
set -e

MY_DIR="$(dirname "$0")"

source ${MY_DIR}/env.sh

for filename in "$@"
do
    echo "$filename"
    if [ -f $filename ]; then
        source ${filename}
    else
       echo "Warning: $filename does not appear to be a valid argument. File $FILE does not exist."
    fi
done
