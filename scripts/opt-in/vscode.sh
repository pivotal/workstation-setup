source scripts/helpers/brew.sh

ME=`whoami`
VSCODE_PREFERENCES_SOURCE_FOLDER="${MY_DIR}/files/vscode"
VSCODE_PREFERENCES_DESTINATION_FOLDER="/Users/$ME/Library/Application Support/Code/User"

brew_cask_install_if_missing visual-studio-code

echo "Installing VS Code Extensions"

cat "$VSCODE_PREFERENCES_SOURCE_FOLDER/extensions.txt" | xargs -L1 code --install-extension

echo "Copying VS Code Settings"

mkdir -p "$VSCODE_PREFERENCES_DESTINATION_FOLDER"
cp "$VSCODE_PREFERENCES_SOURCE_FOLDER/settings.json" "$VSCODE_PREFERENCES_DESTINATION_FOLDER/"
