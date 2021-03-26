echo
echo "Installing Python"

python_version="$DEFAULT_PYTHON_VERSION"
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
