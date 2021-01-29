echo
echo "Installing most recent version of NodeJS"

local nodejs_version="${DEFAULT_NODEJS_VERSION}"
if (! asdf list nodejs) && asdf list nodejs | grep -q "${nodejs_version}" ; then
  echo "Installing node@${nodejs_version}"
  asdf plugin add nodejs || true
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
  asdf install nodejs "${nodejs_version}"
  asdf global nodejs "${nodejs_version}"
else
  echo 'node@${nodejs_version} already installed'
fi


# Some node tools that might be useful to us someday...

#brew install node
#
#echo
#echo "Installing global NodeJS Packages"
#
#npm install --global yo
#npm install --global webpack
#npm install --global grunt-cli
#npm install --global gulp-cli
#
## guard against preinstalled webstorm
#brew install --cask webstorm --force
#
#source ${WORKSTATION_SETUP_HOME}/scripts/common/download-pivotal-ide-prefs.sh
#pushd ~/workspace/pivotal_ide_prefs/cli
#./bin/ide_prefs install --ide=webstorm
#popd
