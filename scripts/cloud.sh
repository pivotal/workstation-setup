echo
echo "Installing Cloud Foundry Command-line Interface"
brew tap cloudfoundry/tap
brew install cf-cli bosh-cli bosh-init bbl
ln -s /usr/local/bin/bosh2 /usr/local/bin/bosh
