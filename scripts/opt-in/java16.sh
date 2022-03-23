echo
echo "Installing Java 16"
brew tap adoptopenjdk/openjdk
brew install adoptopenjdk16

source "${WORKSTATION_SETUP_HOME}/scripts/opt-in/java-tools.sh"
