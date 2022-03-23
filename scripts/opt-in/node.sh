echo
echo "Installing most recent version of NodeJS"

nodejs_version="${DEFAULT_NODEJS_VERSION:v16.13.1}"
if (! asdf list nodejs) && asdf list nodejs | grep -q "${nodejs_version}" ; then
  echo "Installing node@${nodejs_version}"
  asdf plugin add nodejs || true
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
  asdf install nodejs "${nodejs_version}"
  asdf global nodejs "${nodejs_version}"
else
  echo 'node@${nodejs_version} already installed'
fi
