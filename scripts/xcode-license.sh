echo
echo "Accepting the XCode Software License Agreement"
echo
echo "$PASS" | sudo -kS xcodebuild -license accept
