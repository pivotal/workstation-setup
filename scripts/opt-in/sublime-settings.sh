ME=`whoami`
SUBLIME_PREFERENCES_SOURCE_FOLDER="${MY_DIR}/files/sublime_settings"
SUBLIME_PREFERENCES_DESTINATION_FOLDER="/Users/$ME/Library/Application Support/Sublime Text 3/Packages/User/"

SUBLIME_PACKAGES_DESTINATION_FOLDER="/Users/$ME/Library/Application Support/Sublime Text 3/Installed Packages"
SUBLIME_PACKAGE_CONTROL_URL="https://packagecontrol.io/Package%20Control.sublime-package"

echo "Downloading and Installing Sublime PackageControl"

curl -L -o "$SUBLIME_PACKAGES_DESTINATION_FOLDER/Package Control.sublime-package" $SUBLIME_PACKAGE_CONTROL_URL

echo "Copying Sublime Text 3 Settings"

echo "PackageControl Settings"
cp -a -n "$SUBLIME_PREFERENCES_SOURCE_FOLDER/Package Control.sublime-settings" "$SUBLIME_PREFERENCES_DESTINATION_FOLDER/"

echo "User Settings"
cp $SUBLIME_PREFERENCES_SOURCE_FOLDER/Preferences.sublime-settings "$SUBLIME_PREFERENCES_DESTINATION_FOLDER"

printf "RubyTest Settings"
cp $SUBLIME_PREFERENCES_SOURCE_FOLDER/RubyTest.sublime-settings "$SUBLIME_PREFERENCES_DESTINATION_FOLDER"

