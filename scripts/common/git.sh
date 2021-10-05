echo
echo "Installing Git and associated tools"
brew install git
brew tap pivotal-legacy/tap
brew install git-pair
brew install git-together
brew install vim
echo "GitHub CLI -- gh"
brew install gh

# All these applications are independent, so if one
# fails to install, don't stop.
set +e

brew install --cask rowanj-gitx
brew install --cask sourcetree
brew install --cask gitup

set -e

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
