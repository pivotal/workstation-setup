#!/usr/bin/env bash
set +e
echo
echo "Installing Java Development tools"
brew install --cask intellij-idea --force # guard against pre-installed intellij
brew tap jcgay/jcgay
brew install maven-deluxe
brew install gradle

source "${WORK_DIR}/scripts/common/download-jetbrains-ide-prefs.sh"
pushd ~/workspace/jetbrains-ide-prefs/cli 1>/dev/null
  ./bin/ide_prefs install --ide=intellij
popd
set -e
