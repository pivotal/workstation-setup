echo
echo "Installing Terraform tooling"

brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# shell completion

terraform -install-autocomplete