echo
echo "Installing most recent version of OpenJDK"
brew install openjdk

# Configure opensjdk as instructed by 'brew info openjdk'
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.zshenv
echo 'export CPPFLAGS="-I/usr/local/opt/openjdk/include"' >> ~/.zshenv

# more java tools
source ${WORK_DIR}/scripts/opt-in/java-tools.sh
