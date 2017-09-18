# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing Data R&D Engineer applications"

brew install wget
brew install fzf

source ${MY_DIR}/golang.sh
source ${MY_DIR}/c.sh
source ${MY_DIR}/docker.sh

set -e
