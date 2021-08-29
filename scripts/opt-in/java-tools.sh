echo
echo "Installing Java Development tools"
brew install --cask intellij-idea --force # guard against pre-installed intellij
# maven deluxe URL / download does not work for me
brew tap jcgay/jcgay
brew install maven-deluxe
brew install gradle
brew tap spring-io/tap
brew uninstall springboot
brew install spring-boot

source ${MY_DIR}/scripts/common/download-jetbrains-ide-prefs.sh
pushd ~/workspace/jetbrains-ide-prefs/cli
./bin/ide_prefs install --ide=intellij
popd
