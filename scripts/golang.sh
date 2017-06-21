echo
echo "Installing Golang Development tools"

mkdir -p ~/go/src
brew install go --cross-compile-common
brew cask install gogland
