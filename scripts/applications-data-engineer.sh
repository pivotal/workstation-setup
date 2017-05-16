echo
echo "Installing Data R&D Engineer applications"

brew install autoconf
brew install wget
brew install fzf

# Go source
mkdir -p ~/go/src
brew install go --cross-compile-common
export GOPATH=$HOME/go
echo "Adding GOPATH"
echo 'export GOPATH==$HOME/go' >> ~/.bash_profile

# C tools
brew install ccache
brew install ctags
brew install cmake
brew install cscope
brew cask install clion
brew install ninja

# Docker
brew cask install docker

# Docker Bash Completion
# Reference https://docs.docker.com/docker-for-mac/
cd /usr/local/etc/bash_completion.d
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion