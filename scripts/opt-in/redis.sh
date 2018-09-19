#!/usr/bin/env bash

# Don't stop if install fails
set +e
echo
echo "Installing Redis"
brew install redis
set -e
