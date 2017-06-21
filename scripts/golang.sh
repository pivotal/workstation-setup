echo
echo "Installing Golang Development tools"

mkdir -p ~/go/src
brew install go --cross-compile-common
export GOPATH=$HOME/go
echo "Adding GOPATH"
echo 'export GOPATH==$HOME/go' >> ~/.bash_profile

brew cask install gogland
