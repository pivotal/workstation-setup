# Don't stop if android fails
set +e

brew tap AdoptOpenJDK/openjdk
brew_cask_install_if_missing adoptopenjdk8
brew_cask_install_if_missing android-sdk

set -e
