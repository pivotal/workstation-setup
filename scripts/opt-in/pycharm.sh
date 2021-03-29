echo
echo "Installing Pycharm"

# guard against pre-installed pycharm
brew install --cask pycharm --force

source ${WORKSTATION_SETUP_HOME}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=pycharm
popd
