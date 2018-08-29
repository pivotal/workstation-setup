source scripts/helpers/brew.sh


brew_install_if_missing node
brew_install_if_missing yarn


echo ""
echo " ~~~ Making `hostname` a Voom Pairing Machine ~~~"
echo ""

source ${MY_DIR}/scripts/opt-in/ruby.sh
source ${MY_DIR}/scripts/opt-in/node.sh
source ${MY_DIR}/scripts/opt-in/designer.sh
source ${MY_DIR}/scripts/opt-in/heroku.sh
source ${MY_DIR}/scripts/opt-in/mobile.sh
source ${MY_DIR}/scripts/opt-in/sublime-settings.sh

# Install Voom application dependancies
brew_install_if_missing postgresql
brew_install_if_missing redis
brew cask install chromedriver
brew_install_if_missing memcached

# Setup needed databases to start at boot
brew services start postgresql
brew services start redis
brew services start chromedriver

# Voom stores files on Google Drive
brew cask install google-drive-file-stream
brew cask install files/slack-alpha.rb

# Common workstation utilities
brew_install_if_missing htop
brew cask install react-native-debugger

# JAMF
echo "!!! DO NOT FORGET TO ENROLL THIS MACHINE IN JAMF !!!"

