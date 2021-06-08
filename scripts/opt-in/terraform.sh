echo
echo "Installing Terraform tooling"

brew install tfenv tgenv
tfenv install "${DEFAULT_TF_VERSION}"
tgenv install "${DEFAULT_TG_VERSION}"

# shell completion
terraform -install-autocomplete
