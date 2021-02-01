echo
echo "Installing Terraform tooling"

tf_version="${DEFAULT_TF_VERSION}"
if (! asdf list terraform) && asdf list terraform | grep -q "$(tf_version)" ; then
  echo "Installing terrafrom@${tf_version}"
  asdf plugin add terraform || true
  asdf install terraform "${tf_version}"
  asdf global terraform "${tf_version}"
else
  echo 'terraform@${tf_version} already installed'
fi

# shell completion
terraform -install-autocomplete
