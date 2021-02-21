echo
echo "Installing Git and associated tools"
brew install git
brew tap git-duet/tap
brew install git-duet
brew tap pivotal-legacy/tap
brew install git-pair
brew install git-together
brew install git-author
brew install vim
echo "GitHub CLI -- gh"
brew install gh

brew install --cask rowanj-gitx
brew install --cask sourcetree
brew install --cask gitup

echo
echo "Putting a sample git-pair file in ~/.pairs"
cp files/.pairs ~/.pairs

echo
echo "Setting global Git configurations"
git config --global core.editor /usr/local/bin/vim
git config --global transfer.fsckobjects true

mkdir -p ~/.git_templates
git config --global init.templateDir ~/.git_templates
echo "ref: refs/heads/main" > ~/.git_templates/HEAD
