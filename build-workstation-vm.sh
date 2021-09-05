#!/bin/bash
set -ex

# install containerization support
#source "$(dirname "$0")/scripts/common/homebrew.sh"

echo
echo "Installing virtualbox & vagrant..."
echo
echo
brew install virtualbox
brew install virtualbox-extension-pack
brew install vagrant
brew install vagrant-manager
brew install vagrant-completion

echo
echo "Configuring vagrant"
VDIR=$HOME/workspace/vagrantenv/dev
mkdir -p "$VDIR"
cp -rf vagrant "$VDIR/"
cp -rf files "$VDIR/vagrant"
cp -rf vagrant/Vagrantfile "$VDIR"
pushd "$VDIR" || exit
  vagrant destroy || echo "Nothing to destroy..."
  vagrant up --provision
#vagrant provision
popd || exit
