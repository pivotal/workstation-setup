echo
echo "Installing Python tools"

# guard against pre-installed pycharm
brew install --cask pycharm --force

source ${WORK_DIR}/scripts/common/download-jetbrains-ide-prefs.sh
pushd ~/workspace/jetbrains-ide-prefs/cli
./bin/ide_prefs install --ide=pycharm
popd
