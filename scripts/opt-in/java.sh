echo
echo "Installing Java 17"
brew install openjdk@17

source "${WORKSTATION_SETUP_HOME}/scripts/opt-in/java-tools.sh"

# Symlink for Apple Silicon to /opt/homebrew. Symlinks to /usr/local for Intel macs
sudo ln -sfn $(brew --prefix)/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> ~/.zshrc
