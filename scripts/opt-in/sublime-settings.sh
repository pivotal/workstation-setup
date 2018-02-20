ME=`whoami`
SUBLIME_PREFERENCES_SOURCE_FOLDER="${MY_DIR}/files/sublime_settings"
SUBLIME_PREFERENCES_DESTINATION_FOLDER="/Users/$ME/Library/Application Support/Sublime Text 3/Packages/User/"

echo "Copying Sublime Text 3 Settings"

echo "User Settings"
cp $SUBLIME_PREFERENCES_SOURCE_FOLDER/Preferences.sublime-settings "$SUBLIME_PREFERENCES_DESTINATION_FOLDER"

printf "RubyTest Settings"
cp $SUBLIME_PREFERENCES_SOURCE_FOLDER/RubyTest.sublime-settings "$SUBLIME_PREFERENCES_DESTINATION_FOLDER"

