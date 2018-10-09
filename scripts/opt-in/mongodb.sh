#!/usr/bin/env bash

# Don't stop if install fails
set +e
echo
echo "Installing MongoDB"
brew install mongodb
set -e
