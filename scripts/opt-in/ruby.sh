echo
echo "Installing Ruby tools and latest Ruby"
cp files/.irbrc ~/.irbrc
brew install readline
#eval "$(rbenv init -)"
#rbenv install $(rbenv install -l | grep -v - | tail -1) --skip-existing
#rbenv global $(rbenv install -l | grep -v - | tail -1)

# Install rvm and use it to update to the desired Ruby version
ruby_version="$DEFAULT_RUBY_VERSION"

if ! command -v rvm > /dev/null; then
  echo 'Installing rvm...'
  curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
  curl -sSL https://get.rvm.io | bash -s stable

  # Load RVM into a shell session *as a function*
  if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
    # First try to load from a user install
    source "$HOME/.rvm/scripts/rvm"
  elif [[ -s '/usr/local/rvm/scripts/rvm' ]] ; then
    # Then try to load from a root install
    source '/usr/local/rvm/scripts/rvm'
  else
    printf "ERROR: An RVM installation was not found.\n"
  fi
else
  echo 'RVM Installed'
fi


if ! [[ $(rvm ls) == *"${ruby_version}"* ]]; then
  echo "Installing Ruby ${ruby_version}"
  rvm install "ruby-${ruby_version}"
else
  echo "Ruby ${ruby_version} Installed"
fi

rvm --default use "ruby-${ruby_version}"

gem install bundler

# guard against pre-installed rubymine
brew install --cask rubymine --force

source ${WORKSTATION_SETUP_HOME}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=rubymine
popd
