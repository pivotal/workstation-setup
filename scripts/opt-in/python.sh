echo
echo "Installing Python tools"

# guard against pre-installed pycharm
brew cask install pycharm --force

sudo mkdir -p /Users/tsedano/Library/Preferences/Pycharm2018.3

source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=pycharm
popd
