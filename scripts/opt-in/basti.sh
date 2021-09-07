#!/bin/zsh
set +e

source "${WORK_DIR}"/scripts/opt-in/zsh.sh

echo "Installing direnv"
brew install direnv
echo "Installing zoxide"
brew install zoxide
echo "Uninstalling jetbrains-toolbox"
brew uninstall --cask --force jetbrains-toolbox
echo "Uninstalling docker"
brew uninstall docker

cat <<EOF >> ~/.zshrc.local
alias j="autojump"
alias z="zoxide"
eval "\$(zoxide init zsh)"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
EOF

if [[ $(uname) == 'Darwin' ]]
then
  xcode-select --install
  brew install microsoft-office
  brew install adobe-creative-cloud
  brew install boxcryptor
  brew install google-drive
  brew install meetingbar
  brew install miro
  brew install balenaetcher
  brew install onyx
  brew install signal
  brew install spotify
  brew install tuple
  brew install zoom
  brew install deepl
  brew install expressvpn
  brew install fanny
  brew install keka
  brew install slack
  brew install calibre
  brew install veracrypt
  brew install vnc-viewer
  brew install teamviewer
  brew install mas
  brew install arq

  # mac app store installations
  mas purchase 1284863847 # Unsplash Wallpapers
  mas purchase 973134470 # Be focused
  mas purchase 919269455 # StuffIt Expander
  mas purchase 1474276998 # HP Smart for Desktop
  mas purchase 967004861 # HP Easy Scan
  mas purchase 497799835 # XCode
  sudo xcodebuild -license accept
  mas purchase 1094255754 # outbank
  mas purchase 1147396723 # WhatsApp

  # mac os configurations
  source "$WORK_DIR"/scripts/opt-in/basti-macos-config.sh
fi
set -e

  # install python & java & lima
source "$WORK_DIR/scripts/opt-in/python.sh"
source "$WORK_DIR/scripts/opt-in/java.sh"
source "$WORK_DIR/scripts/opt-in/containerization.sh"
