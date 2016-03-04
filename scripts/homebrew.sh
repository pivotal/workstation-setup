echo

if hash brew 2>/dev/null; then
  echo "Homebrew is already installed!"
else
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo
echo "Ensuring you have the latest Homebrew..."
brew update

echo 
echo "Ensuring you have a healthy Homebrew enviroment..."
brew doctor

echo
echo "Ensuring your Homebrew directory is writeable..."
sudo chown -R $(whoami) /usr/local/bin

echo
echo "Installing Homebrew services..."
brew tap homebrew/services

echo
echo "Adding Pivotal Tab to Homebrew"
brew tap pivotal/tap

echo
echo "Cleaning up your Homebrew installation..."
brew cleanup

echo
echo "Adding Homebrew's sbin to your PATH..."
echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.bash_profile
