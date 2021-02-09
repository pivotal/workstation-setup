# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing applications"

# Utilities

brew install --cask alfred
brew install --cask shiftit
echo
echo "configure shiftit to select 1/3 screen width, 1/2 screen width and 2/3 screen width:"
echo "`defaults write org.shiftitapp.ShiftIt multipleActionsCycleWindowSizes YES`"
echo
brew install --cask dash
brew install --cask postman
brew install --cask quicklook-json

# RxRevu specific
brew install gnupg

# Terminals

brew install --cask iterm2

# Browsers

brew install --cask google-chrome
brew install --cask firefox

# Communication

brew install --cask slack

# Text Editors

brew install --cask macdown
brew install --cask sublime-text
brew install --cask textmate
brew install --cask macvim
brew install --cask jetbrains-toolbox --force # guard against pre-installed jetbrains-toolbox
brew install --cask visual-studio-code
brew install --cask atom
set -e

# Password Management

brew install --cask 1password-cli
