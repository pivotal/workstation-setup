source scripts/helpers/brew.sh

echo
echo "Installing Git and associated tools"
brew_install_if_missing git
brew tap git-duet/tap
brew_install_if_missing git-duet
brew_install_if_missing git-pair
brew_install_if_missing seattle-beach/tap/git-together

# Get latest version of vim
brew_install_if_missing vim --with-override-system-vi

brew_cask_install_if_missing rowanj-gitx
brew_cask_install_if_missing sourcetree

echo
echo "Putting a sample git-pair file in ~/.pairs"
cp files/.pairs ~/.pairs

echo
echo "Setting global Git configurations"
git config --global core.editor /usr/local/bin/vim
git config --global transfer.fsckobjects true

