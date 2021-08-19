echo

echo "shiftit is not currently under active development"
echo "consider replacing with https://github.com/peterklijn/hammerspoon-shiftit"

brew install --cask shiftit
echo
echo "configure shiftit to select 1/3 screen width, 1/2 screen width and 2/3 screen width:"
echo "`defaults write org.shiftitapp.ShiftIt multipleActionsCycleWindowSizes YES`"
echo

echo "Configuring ShiftIt"
open /Applications/ShiftIt.app
