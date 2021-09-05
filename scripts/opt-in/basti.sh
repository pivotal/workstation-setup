#!/bin/zsh
set +e

brew install zoxide
brew install zsh-autosuggestions
brew uninstall --cask --force jetbrains-toolbox
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
  mas purchase 1094255754 # outbank
  mas purchase 1147396723 # WhatsApp

  # configure dock
  dockutil --list | awk -F$(printf '\t') '{print "dockutil --remove \""$1"\" --no-restart"}' | sh
  dockutil --add "/System/Applications/Mail.app" --no-restart
  dockutil --add "/Applications/Safari.app" --no-restart
  dockutil --add "/System/Applications/Calendar.app" --no-restart
  dockutil --add "/System/Applications/Contacts.app" --no-restart
  dockutil --add "/Applications/Slack.app" --no-restart
  dockutil --add "/Applications/iTerm.app" --no-restart
  dockutil --add "/Applications/IntelliJ IDEA.app" --no-restart
  dockutil --add "/Applications/Miro.app" --no-restart
  dockutil --add "/System/Applications/FaceTime.app" --no-restart
  dockutil --add "/System/Applications/Messages.app" --no-restart
  dockutil --add "/Applications/Signal.app" --no-restart
  dockutil --add "/Applications/Adobe Lightroom CC/Adobe Lightroom.app" --no-restart
  dockutil --add "/Applications/Microsoft Excel.app" --no-restart
  dockutil --add "/Applications/Microsoft Word.app" --no-restart
  dockutil --add /"Applications/Microsoft OneNote.app" --no-restart
  dockutil --add "/System/Applications/Notes.app" --no-restart
  dockutil --add "/System/Applications/Reminders.app" --no-restart
  dockutil --add "/System/Applications/Utilities/Activity Monitor.app" --no-restart
  dockutil --add "$HOME/Boxcryptor/OneDrive/Documents" --view auto --display stack --no-restart
  dockutil --add "$HOME/Downloads/" --view auto --display stack
fi
set -e

  # install python & java & lima
source "$MY_DIR/scripts/opt-in/python.sh"
source "$MY_DIR/scripts/opt-in/java.sh"
source "$MY_DIR/scripts/opt-in/containerization.sh"
