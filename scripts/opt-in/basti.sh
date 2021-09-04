#!/bin/zsh
set +e

brew install zoxide
brew install zsh-autosuggestions
brew uninstall --cask --force jetbrains-toolbox
brew uninstall docker

echo 'source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc.local

if [[ $(uname) == 'Darwin' ]]
then
  sudo xcodebuild -license
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

  # install python & java & lima
  source "$MY_DIR/scripts/opt-in/python.sh"
  source "$MY_DIR/scripts/opt-in/java.sh"
  source "$MY_DIR/scripts/opt-in/containerization.sh"

  # mac app store installations
  mas purchase "$(mas search "Unsplash Wallpapers" | head -1 | cut -c1-12)"
  mas purchase "$(mas search "Be Focused" | head -1 | cut -c1-12)"
  mas purchase "$(mas search "StuffIt Expander" | head -1 | cut -c1-12)"
  mas purchase "$(mas search "HP Smart for Desktop" | head -1 | cut -c1-12)"
  mas purchase "$(mas search "HP Easy Scan" | head -1 | cut -c1-12)"

  # configure dock
  source "${MY_DIR}/scripts/common/configuration-osx.sh"
  dockutil --list | awk -F\t '{print "dockutil --remove \""$1"\" --no-restart"}' | sh
  dockutil --add /System/Applications/Mail.app --no-restart
  dockutil --add /Applications/Safari.app --no-restart
  dockutil --add /System/Applications/Calendar.app --no-restart
  dockutil --add /System/Applications/Contacts.app --no-restart
  dockutil --add /Applications/Slack.app --no-restart
  dockutil --add /Applications/iTerm.app --no-restart
  dockutil --add /Applications/IntelliJ\ IDEA.app --no-restart
  dockutil --add /Applications/Miro.app --no-restart
  dockutil --add /System/Applications/FaceTime.app --no-restart
  dockutil --add /System/Applications/Messages.app --no-restart
  dockutil --add /Applications/Signal.app --no-restart
  dockutil --add /Applications/Adobe\ Lightroom\ CC/Adobe\ Lightroom.app --no-restart
  dockutil --add /Applications/Microsoft\ Excel.app --no-restart
  dockutil --add /Applications/Microsoft\ Word.app --no-restart
  dockutil --add /Applications/Microsoft\ OneNote.app --no-restart
  dockutil --add /System/Applications/Notes.app --no-restart
  dockutil --add /System/Applications/Reminders.app --no-restart
  dockutil --add /System/Applications/Utilities/Activity\ Monitor.app --no-restart
  dockutil --add '~/Downloads' --view grid --display stack --no-restart
  dockutil --add '~/Documents' --view grid --display stack
fi
set -e

cat <<EOF >> ~/.zshrc.local
alias j="autojump"
alias z="zoxide"
eval "\$(zoxide init zsh)"
EOF
