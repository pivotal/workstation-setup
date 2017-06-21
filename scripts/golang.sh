echo
echo "Installing Golang Development tools"

mkdir -p ~/go/src
brew install go --cross-compile-common
brew cask install gogland

echo
echo "Setting up Gogland preferences from pivotal_ide_prefs..."
pushd ~/workspace
rm -rf pivotal_ide_prefs
git clone https://github.com/pivotal/pivotal_ide_prefs.git
pushd pivotal_ide_prefs/cli/
./bin/ide_prefs install --ide=gogland
popd
popd
