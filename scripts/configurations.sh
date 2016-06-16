echo
# prereqs
brew install tccutil
brew tap OJFord/formulae
brew install loginitems

echo "Configuring iTerm"
cp files/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Configuring ShiftIt"
sudo tccutil --insert "org.shiftitapp.ShiftIt" # Enable Accessibility Settings
loginitems -a "ShiftIt" -p "/Users/$(whoami)/Applications/ShiftIt.app" # Start on login
open ~/Applications/ShiftIt.app

echo "Configuring FlyCut"
loginitems -a "FlyCut" # Start at login
open /Applications/ShiftIt.app

echo
echo "Installing vim configuration"
pushd ~/
rm -rf ~/.vim
git clone https://github.com/pivotal/vim-config.git ~/.vim
~/.vim/bin/install
popd

echo
echo "Setting up Pivotal IDE preferences..."
pushd ~/workspace
rm -rf pivotal_ide_prefs
git clone https://github.com/pivotal/pivotal_ide_prefs.git
pushd pivotal_ide_prefs/cli/
./bin/ide_prefs install --ide=intellij
./bin/ide_prefs install --ide=rubymine
popd
popd

