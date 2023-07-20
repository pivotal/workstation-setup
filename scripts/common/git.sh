echo
echo "Installing Git and associated tools"
brew install git
brew install frost/tap/git-mob
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
echo "Putting a sample git-coauthors file in ~/.git-coauthors"
cp files/.git-coauthors ~/.git-coauthors

echo
echo "Setting global Git configurations"
git config --global core.editor vim
git config --global transfer.fsckobjects true

echo
echo "Setting default branch name to main"
mkdir -p ~/.git_templates
git config --global init.templateDir ~/.git_templates
echo "ref: refs/heads/main" > ~/.git_templates/HEAD

echo
echo "Setting up global .gitignore"
git config --global core.excludesfile ${WORKSTATION_SETUP_HOME}/files/.gitignore
