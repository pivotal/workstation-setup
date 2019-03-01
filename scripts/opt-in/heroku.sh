source scripts/helpers/brew.sh

echo
echo "Installing Heroku tools"
brew tap heroku/brew
brew list | grep heroku || brew install heroku/brew/heroku
