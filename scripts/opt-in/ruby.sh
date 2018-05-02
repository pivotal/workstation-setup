echo
echo "Installing Ruby tools and Ruby 2.3.1"
cp files/.irbrc ~/.irbrc
brew install readline
eval "$(rbenv init -)"
echo "$(rbenv init -)"	>> ~/.bash_profile
echo "alias be='bundle exec'"	>> ~/.bash_profile
rbenv install 2.4.2 --skip-existing
rbenv global 2.4.2
gem install bundler
rbenv rehash

# guard against pre-installed rubymine
brew cask install rubymine --force

source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=rubymine
popd

gem install bundler