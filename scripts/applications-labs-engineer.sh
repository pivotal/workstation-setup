echo
echo "Configuring direnv with bash-it"
brew install direnv
cp files/direnv.bash ~/.bash_it/custom/direnv.bash

source ${MY_DIR}/ruby.sh
source ${MY_DIR}/node.sh
