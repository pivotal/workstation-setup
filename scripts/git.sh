echo
echo "Installing Git and associated tools"
brew install git
brew tap git-duet/tap
brew install git-duet
brew install git-pair
brew cask install github-desktop
brew cask install sourcetree

echo
echo "Putting a sample git-pair file in ~/.pairs"
cp files/.pairs ~/.pairs

