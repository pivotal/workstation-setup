echo
echo "Installing Git and associated tools"
brew install git
brew tap git-duet/tap
brew install git-duet
brew install git-pair
brew install seattle-beach/tap/git-together

brew cask install rowanj-gitx
brew cask install sourcetree

echo
echo "Putting a sample git-pair file in ~/.pairs"
cp files/.pairs ~/.pairs

echo
echo "Setting global Git configurations"
git config --global core.editor /usr/bin/vim
git config --global transfer.fsckobjects true
