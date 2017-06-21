# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing applications"

# Utilities

brew cask install flux
brew cask install flycut
brew cask install shiftit
brew cask install dash
brew cask install postman
brew cask install google-drive
brew install the_silver_searcher

# Terminals

brew cask install iterm2

# Browsers

brew cask install google-chrome
brew cask install firefox

# Communication

brew cask install slack
brew cask install screenhero
brew cask install skype
brew cask install zoomus

# Text Editors

brew cask install macdown
brew cask install sublime-text
brew cask install textmate
brew cask install macvim

# Emulation tools

brew cask install virtualbox

set -e
