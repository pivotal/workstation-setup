# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing editors"
echo "Only installing Visual Studio Code and Vim by default"
echo "Uncomment other editors and rerun if you want them"

brew install --cask visual-studio-code
brew install vim

echo
echo "Other editors are available in this script."
echo "Uncomment what you want."
# brew install --cask macdown
# brew install --cask sublime-text
# brew install --cask textmate
# brew install --cask macvim
# brew install --cask jetbrains-toolbox --force # guard against pre-installed jetbrains-toolbox
# brew install --cask atom

set -e
