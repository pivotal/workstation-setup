echo
echo "Installing Golang Development tools"

mkdir -p ~/go/src
brew install go
brew install dep
brew install --cask goland

source ${MY_DIR}/scripts/common/download-jetbrains-ide-prefs.sh
pushd ~/workspace/jetbrains-ide-prefs/cli
./bin/ide_prefs install --ide=goland
popd
