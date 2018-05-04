echo
echo "Installing NodeJS"

brew install node


echo
echo "Installing global NodeJS Packages"

npm install -g n
npm install --global yo
npm install --global webpack
npm install --global grunt-cli
npm install --global gulp-cli

sudo n 7.10.0
npm install gulp -g	

