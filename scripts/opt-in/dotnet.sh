echo
echo "Installing dotnet requirements"
brew install --cask dotnet dotnet-sdk
source ${WORK_DIR}/scripts/opt-in/dotnet-tools.sh
