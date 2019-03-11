echo
echo "Installing Python tools"

# guard against pre-installed pycharm
brew cask install pycharm --force

source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=pycharm
popd
