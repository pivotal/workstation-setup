echo
echo "Installing Git and associated tools"
brew install git

echo
echo "[Skipped] Setting global Git configurations"

# Unclear on the relevance of this in git v2+
# git config --global transfer.fsckobjects true

echo "Installing Github CLI"
brew install gh

set -e