echo
echo "Installing Vineti specific stuff"

brew install redis
brew services start redis

brew install postgresql  
brew services start postgresql    
createdb

brew install wget

brew install yarn --without-node