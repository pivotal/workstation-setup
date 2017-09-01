echo
echo "Installing common C development tools and libraries"
brew install ccache
brew install ctags
brew install cmake
brew install cscope
brew cask install clion
brew install ninja

source ${MY_DIR}/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=clion
popd