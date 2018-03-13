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

echo
echo "Installing git hooks for cred-alert"
# for more information see https://github.com/pivotal-cf/git-hooks-core
git clone https://github.com/pivotal-cf/git-hooks-core $HOME/workspace/git-hooks-core
git config --global --add core.hooksPath $HOME/workspace/git-hooks-core
# install cred-alert-cli
os_name=$(uname | awk '{print tolower($1)}')
curl -o cred-alert-cli \
  https://s3.amazonaws.com/cred-alert/cli/current-release/cred-alert-cli_${os_name}
chmod 755 cred-alert-cli
mv cred-alert-cli /usr/local/bin # <= or other directory in ${PATH}
