echo
echo "Installing NodeJS"

bash-it enable plugin nvm
# brew install nvm (The NVM website suggests there are some problems with the homebrew version; don't use it)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

brew install node
brew install yarn

nvm install v8
nvm alias default v8
