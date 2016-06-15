#!/usr/bin/env bash

# Fail immediately if any errors occur
set -e

SCRIPTS_DIR="$(dirname "$0")/scripts"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root, use sudo "$0" instead" 1>&2
   exit 1
fi

${SCRIPTS_DIR}/setup.sh designer
