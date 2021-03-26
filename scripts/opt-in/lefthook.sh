
echo
echo "Installing lefthook"

if ! command -v lefthook > /dev/null; then
  brew install Arkweid/lefthook/lefthook
else
  echo "lefthook already installed"
fi
