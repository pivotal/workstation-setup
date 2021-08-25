echo
echo "Installing most recent version of OpenJDK"
brew install openjdk

# Configure opensjdk as instructed by 
# brew info openjdk
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.zshrc
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

# more java tools
source ${MY_DIR}/scripts/opt-in/java-tools.sh
