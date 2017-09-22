echo
echo "Installing Git and associated tools"
brew install git
brew install git-pair

brew cask install rowanj-gitx

echo
echo "Putting a sample git-pair file in ~/.pairs"
cp files/.pairs ~/.pairs

echo
echo "Setting global Git configurations"
git config --global core.editor /usr/bin/vim
git config --global transfer.fsckobjects true
