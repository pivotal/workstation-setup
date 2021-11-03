echo
echo "Installing most recent version of OpenJDK"
brew install openjdk

# Configure opensjdk as instructed by 'brew info openjdk'
sudo ln -sfn "$(brew --prefix)/opt/openjdk/libexec/openjdk.jdk" /Library/Java/JavaVirtualMachines/openjdk.jdk
echo "export PATH=\"$(brew --prefix)/opt/openjdk/bin:\$PATH\"" >> ~/.zshenv
echo "export CPPFLAGS=\"-I$(brew --prefix)/opt/openjdk/include\"" >> ~/.zshenv

# more java tools
source ${MY_DIR}/scripts/opt-in/java-tools.sh