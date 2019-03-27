ME=`whoami`
VSCODE_PREFERENCES_SOURCE_FOLDER="${MY_DIR}/files/vscode"
VSCODE_PREFERENCES_DESTINATION_FOLDER="/Users/$ME/Library/Application Support/Code/User"

rm -rf /tmp/"Visual Studio Code.app"
rm -rf /tmp/vscode.zip

curl -o /tmp/vscode.zip -L https://go.microsoft.com/fwlink/?LinkID=620882
unzip /tmp/vscode.zip -d /tmp
mv /tmp/"Visual Studio Code.app" /Applications

echo "Adding VS Code command to \$PATH"

echo "export PATH=\"\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin\"" >> ~/.bash_profile
source ~/.bash_profile

echo "Installing VS Code Extensions"

cat "$VSCODE_PREFERENCES_SOURCE_FOLDER/extensions.txt" | xargs -L1 code --install-extension

echo "Copying VS Code Settings"

mkdir -p "$VSCODE_PREFERENCES_DESTINATION_FOLDER"
cp "$VSCODE_PREFERENCES_SOURCE_FOLDER/settings.json" "$VSCODE_PREFERENCES_DESTINATION_FOLDER/"

echo "Cleaning up any remaining files in tmp"
rm -rf /tmp/"Visual Studio Code.app"
rm -rf /tmp/vscode.zip
