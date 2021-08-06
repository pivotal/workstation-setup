echo

if hash brew 2>/dev/null; then
  echo "Homebrew is already installed!"
else
  echo "Installing Homebrew..."
  yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo
echo "Ensuring you have the latest Homebrew..."
brew update

echo
echo "Ensuring your Homebrew directory is writable..."
sudo chown -Rf $(whoami) $(brew --prefix)/*

echo
echo "Installing Homebrew services..."
brew tap homebrew/services

echo
echo "Adding Pivotal tap to Homebrew"
brew tap pivotal/tap

echo
echo "Adding Powerline fonts tap to Homebrew"
brew tap homebrew/cask-fonts

echo
echo "Add font-hack-nerd-font"
brew install --cask font-hack-nerd-font

echo
echo "Upgrading existing brews..."
brew upgrade

echo "Cleaning up your Homebrew installation..."
brew cleanup
