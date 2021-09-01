echo
echo "Installing Java Development tools"
brew install --cask intellij-idea --force # guard against pre-installed intellij
brew tap jcgay/jcgay
brew install maven-deluxe
brew install gradle

source ${MY_DIR}/scripts/common/download-jetbrains-ide-prefs.sh
pushd ~/workspace/jetbrains-ide-prefs/cli
./bin/ide_prefs install --ide=intellij
popd
