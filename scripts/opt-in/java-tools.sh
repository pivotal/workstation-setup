echo
echo "Installing Java Development tools"
brew tap jcgay/jcgay
brew install maven
brew install gradle
brew tap spring-io/tap
brew install spring-boot
brew install ktlint

source ${WORKSTATION_SETUP_HOME}/scripts/opt-in/intellij.sh
