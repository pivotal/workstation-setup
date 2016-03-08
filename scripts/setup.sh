#!/usr/bin/env bash

# Fail immediately if any errors occur
set -e

setup_dir="$(dirname "$0")"

clear

echo
echo "You need to agree to the Xcode Software License Agreement"
echo "You will need to enter your password first."
echo "Then, when the agree comes up, press 'q' to jump to the end and then type 'agree' and press return"
echo

sudo xcodebuild -license

# Note: Homebrew needs to be set up first
$setup_dir/homebrew.sh
$setup_dir/configuration-osx.sh
$setup_dir/configuration-bash.sh
$setup_dir/git.sh
$setup_dir/java.sh
$setup_dir/ruby.sh
$setup_dir/node.sh
$setup_dir/node-packages.sh
$setup_dir/cloud.sh
$setup_dir/applications.sh
$setup_dir/configurations.sh

echo
echo "Done!"

echo
echo "After checking the above output for any problems, start a new iTerm session to make use of all the tools that have been installed."
echo "Additionally, the results of this setup have been stored in setup.log for review."

echo

