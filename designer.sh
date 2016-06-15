#!/usr/bin/env bash

# Fail immediately if any errors occur
set -e

SCRIPTS_DIR="$(dirname "$0")/scripts"

${SCRIPTS_DIR}/setup.sh designer
