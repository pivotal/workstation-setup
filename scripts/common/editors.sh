# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing editors"
echo "Only installing Visual Studio Code"

brew install --cask visual-studio-code

set -e
