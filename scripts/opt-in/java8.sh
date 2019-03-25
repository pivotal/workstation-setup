echo
echo "Installing Java 8"
brew tap homebrew/cask-versions
brew cask install java8
source ${MY_DIR}/scripts/opt-in/java-tools.sh
