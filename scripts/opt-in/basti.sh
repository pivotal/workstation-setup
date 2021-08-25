#!/bin/zsh
set +e

brew install zoxide 

if [[ $(uname) == 'Darwin' ]]
then
  sudo xcodebuild -license
  xcode-select --install
  brew install --force microsoft-office
  brew install --force adobe-creative-cloud
  brew install --force boxcryptor
  brew install --force google-drive
  brew install --force meetingbar
  brew install --force miro
  brew install --force balenaetcher
  brew install --force onyx
  brew install --force signal
  brew install --force spotify
  brew install --force tuple
  brew install --force zoom
  brew install --force deepl
  brew install --force expressvpn
  brew install --force fanny
  brew install --force keka
  brew install --force slack
  brew install --force calibre
  brew install --force veracrypt
  brew install --force vnc-viewer
  brew install --force teamviewer
  brew install --force mas
  brew install --force arq
  
  # install python
  source $MY_DIR/scripts/opt-in/python.sh

  # mac app store installations
  mas purchase $(mas search "Unsplash Wallpapers" | head -1 | cut -c1-12)
  mas purchase $(mas search "Be Focused" | head -1 | cut -c1-12)
  mas purchase $(mas search "StuffIt Expander" | head -1 | cut -c1-12)
  mas purchase $(mas search "HP Smart for Desktop" | head -1 | cut -c1-12)
  mas purchase $(mas search "HP Easy Scan" | head -1 | cut -c1-12)

  # download iriun
  curl -o iriun.pkg https://1758658189.rsc.cdn77.org/IriunWebcam-2.5.1.pkg && open iriun.pkg && rm iriun.pkg

  # configure apps
  open "/Applications/Utilities/Adobe\ Creative\ Cloud/ACC/Creative\ Cloud.app"

  # configure dock
  source ${MY_DIR}/scripts/common/configuration-osx.sh
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
  dockutil --add /System/Applications/Reminders.app
  dockutil --add /System/Applications/Utilities/Activity Monitor.app
fi
set -e
