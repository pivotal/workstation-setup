#!/usr/bin/env bash

# Fail immediately if any errors occur
set -e

SETUP_TYPE=$1
MY_DIR="$(dirname "$0")"

clear

echo
echo "Setting up a '$SETUP_TYPE' machine..."

${MY_DIR}/xcode-license.sh

# Note: Homebrew needs to be set up first
${MY_DIR}/homebrew.sh
${MY_DIR}/configuration-osx.sh
${MY_DIR}/configuration-bash.sh
${MY_DIR}/git.sh
${MY_DIR}/java.sh
${MY_DIR}/ruby.sh
${MY_DIR}/node.sh
${MY_DIR}/node-packages.sh
${MY_DIR}/cloud.sh
${MY_DIR}/applications-common.sh

if [ "$SETUP_TYPE" -eq "designer" ]
then
  ${MY_DIR}/applications-designer.sh
fi

${MY_DIR}/configurations.sh

${MY_DIR}/finished.sh

