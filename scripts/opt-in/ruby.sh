echo
echo "Installing Ruby tools and Ruby 2.5.1"
cp files/.irbrc ~/.irbrc
brew_install_if_missing readline
eval "$(rbenv init -)"
rbenv install 2.5.1 --skip-existing
rbenv global 2.5.1
gem install bundler
rbenv rehash

