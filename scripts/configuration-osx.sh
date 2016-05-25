echo
echo 'Customizing OS X configuration'

# set menu clock
# see http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
defaults write com.apple.menuextra.clock "DateFormat" 'EEE MMM d  h:mm:ss a'
killall SystemUIServer

# hide the dock
defaults write com.apple.dock autohide -bool true
killall Dock

# fast key repeat rate, requires reboot to take effect
defaults write /Users/pivotal/Library/Preferences/.GlobalPreferences KeyRepeat -int 1
defaults write /Users/pivotal/Library/Preferences/.GlobalPreferences InitialKeyRepeat -int 15

# set finder to display full path in title bar
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true

# stop Photos from opening automatically
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
