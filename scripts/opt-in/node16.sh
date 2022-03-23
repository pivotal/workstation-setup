echo
echo "Installing the latest LTS of NodeJS"

brew uninstall --ignore-dependencies node || true
brew cleanup
if [[ ! -d /opt/homebrew/Cellar/node@16 ]]; then
  brew install node@16
  brew link --overwrite node@16
  echo 'export PATH="/opt/homebrew/opt/node@16/bin:$PATH"' >> ~/.zshrc
  echo 'export LDFLAGS="-L/opt/homebrew/opt/node@16/lib"' >> ~/.zshrc
  echo 'export CPPFLAGS="-I/opt/homebrew/opt/node@16/include"' >> ~/.zshrc
fi

