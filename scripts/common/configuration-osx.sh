echo
echo 'Customizing OS X configuration'

# fast key repeat rate, requires reboot to take effect
defaults write ~/Library/Preferences/.GlobalPreferences KeyRepeat -int 1
defaults write ~/Library/Preferences/.GlobalPreferences InitialKeyRepeat -int 15

# set finder to display full path in title bar
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true


# modify appearance of dock: remove standard icons, add chrome and iTerm
brew install dockutil
dockutil --list | awk -F\t '{print "dockutil --remove \""$1"\" --no-restart"}' | sh
dockutil --add /Applications/Google\ Chrome.app --no-restart
dockutil --add /Applications/iTerm.app

# Force Preference Refresh
killall -u $USER cfprefsd

echo
echo "Configuring iTerm"
cp files/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Configuring Rectangle"
cp files/com.knollsoft.Rectangle.plist ~/Library/Preferences/com.knollsoft.Rectangle.plist
open /Applications/Rectangle.app

echo "Configuring FlyCut"
open /Applications/Flycut.app
