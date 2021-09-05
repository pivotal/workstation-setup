echo
echo "Installing tfenv to manage Terraform versions"
brew install tfenv
tfenv install latest

# shell completion
terraform -install-autocomplete
