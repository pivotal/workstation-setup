echo
echo "Installing Ruby tools and Ruby 2.3.1"
cp files/.irbrc ~/.irbrc
brew install readline
eval "$(rbenv init -)"
rbenv install 2.3.1 --skip-existing
rbenv global 2.3.1
gem install bundler
rbenv rehash

brew cask install rubymine
