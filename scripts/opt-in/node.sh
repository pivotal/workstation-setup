echo
echo "Installing most recent version of NodeJS"

brew install node

echo
echo "Installing global NodeJS Packages"

npm install --global yo
npm install --global webpack
npm install --global grunt-cli
npm install --global gulp-cli

# guard against preinstalled webstorm
brew install --cask webstorm --force

source ${WORK_DIR}/scripts/common/download-jetbrains-ide-prefs.sh
pushd ~/workspace/jetbrains-ide-prefs/cli
./bin/ide_prefs install --ide=webstorm
popd
