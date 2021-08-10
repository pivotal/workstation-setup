echo
echo "Installing Git and associated tools"
brew install git
brew tap git-duet/tap
brew install git-duet
brew install git-pair
brew install git-together
brew install git-author
brew install vim

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

HOOKS_DIRECTORY=$HOME/workspace/git-hooks-core
if [ ! -d $HOOKS_DIRECTORY ]; then
  echo
  echo "Installing git hooks for cred-alert"
  # for more information see https://github.com/pivotal-cf/git-hooks-core
  git clone https://github.com/pivotal-cf/git-hooks-core $HOOKS_DIRECTORY
  git config --global --add core.hooksPath $HOOKS_DIRECTORY
else
  echo
  echo "Updating git-hooks for cred-alert"
  pushd $HOOKS_DIRECTORY
  git pull -r
  popd
fi

# install cred-alert-cli
os_name=$(uname | awk '{print tolower($1)}')
curl -L -o cred-alert-cli \
  https://github.com/pivotal-cf/cred-alert/releases/latest/download/cred-alert-cli_${os_name}
chmod 755 cred-alert-cli
mv cred-alert-cli /usr/local/bin # <= or other directory in ${PATH}
