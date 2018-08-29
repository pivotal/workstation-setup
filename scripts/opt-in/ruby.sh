echo
echo "Installing Ruby tools and Ruby 2.5.1"
cp files/.irbrc ~/.irbrc
brew_install_if_missing readline
eval "$(rbenv init -)"
rbenv install 2.5.1 --skip-existing
rbenv global 2.5.1
gem install bundler
rbenv rehash

source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=rubymine
popd
