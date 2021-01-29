echo
echo "Installing Python"

local python_version="$DEFAULT_PYTHON_VERSION"
if [[ ! "$(python --version)" = "${python_version}" ]]; then
  asdf plugin add python || true
  asdf install python "${python_version}"
  asdf global python "${python_version}"
else
  echo "python@"${python_version}" already installed"
fi
pip install --upgrade pip
pip install pipenv
pip install poetry
pip install awscli
asdf reshim python

echo
echo "Installing Pycharm"

# guard against pre-installed pycharm
brew install --cask pycharm --force

source ${WORKSTATION_SETUP_HOME}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=pycharm
popd
