echo
echo "Installing dotnet requirements"
brew cask install dotnet dotnet-sdk
source ${MY_DIR}/scripts/opt-in/dotnet-tools.sh
