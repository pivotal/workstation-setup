echo
echo "Installing NodeJS 8.x.x"

brew install node@8
brew link node@8 --force

echo
echo "Installing global NodeJS Packages"

npm install --global yo
npm install --global webpack
npm install --global grunt-cli
npm install --global gulp-cli