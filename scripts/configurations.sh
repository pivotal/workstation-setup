echo
# prereqs
brew tap OJFord/formulae
brew install loginitems

echo "Configuring iTerm"
cp files/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Configuring ShiftIt"
loginitems -a "ShiftIt" # Start on login
open /Applications/ShiftIt.app

echo "Configuring FlyCut"
loginitems -a "Flycut" # Start at login
open /Applications/Flycut.app

echo
echo "Installing vim configuration"
pushd ~/
if [ ! -d ~/.vim ]; then
    git clone https://github.com/pivotal/vim-config.git ~/.vim
fi
~/.vim/bin/install
popd

echo
echo "Setting up Pivotal IDE preferences..."
pushd ~/workspace
if [ ! -d ~/workspace/pivotal_ide_prefs ]; then
    git clone https://github.com/pivotal/pivotal_ide_prefs.git
fi
pushd pivotal_ide_prefs/cli/
./bin/ide_prefs install --ide=intellij
./bin/ide_prefs install --ide=rubymine
popd
popd

