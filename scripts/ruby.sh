echo
echo "Installing Ruby tools and Ruby 2.3.0"
brew install rbenv
eval "$(rbenv init -)"
rbenv install 2.3.0 --skip-existing
rbenv global 2.3.0
gem install bundler
rbenv rehash

brew cask install rubymine

echo
echo "Adding rbenv initialization to .bash_profile..."
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

