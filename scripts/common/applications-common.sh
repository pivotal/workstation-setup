# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing applications"

# Utilities

brew install --cask flycut
brew install --cask rectangle

# Terminals
# Pending discussion we may move to Warp
# brew install --cask iterm2

# Browsers

brew install --cask google-chrome
brew install --cask firefox

# Communication
brew install --cask slack
brew install --cask zoom

set -e
