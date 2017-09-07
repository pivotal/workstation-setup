echo
echo "Installing Ruby tools and Ruby 2.3.1"
cp files/.irbrc ~/.irbrc
brew install readline
eval "$(rbenv init -)"
rbenv install 2.3.1 --skip-existing
rbenv global 2.3.1
gem install bundler
rbenv rehash

# guard against pre-installed rubymine
brew cask install rubymine --force

source ${MY_DIR}/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=rubymine
popd
