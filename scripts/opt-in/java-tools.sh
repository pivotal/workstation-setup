echo
echo "Installing Java Development tools"
brew install --cask intellij-idea --force # guard against pre-installed intellij
brew tap jcgay/jcgay
brew install maven
brew install gradle
brew tap spring-io/tap
brew install spring-boot

source ${WORKSTATION_SETUP_HOME}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=intellij
popd
