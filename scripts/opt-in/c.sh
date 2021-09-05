echo
echo "Installing common C development tools and libraries"
brew install ccache
brew install ctags
brew install cmake
brew install cscope
brew install --cask clion
brew install ninja

source ${WORK_DIR}/scripts/common/download-jetbrains-ide-prefs.sh
pushd ~/workspace/jetbrains-ide-prefs/cli
./bin/ide_prefs install --ide=clion
popd
