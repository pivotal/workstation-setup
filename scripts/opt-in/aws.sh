echo
echo "Installing the AWS cli"

brew install awscli pipx
brew install awsume
pipx ensurepath
pipx install aws-sso-util

if [[ ! -d ~/.aws ]] ; then
  mkdir ~/.aws
fi

if [[ ! -f ~/.aws/config ]] ; then
cp "${WORKSTATION_SETUP_HOME}/files/aws_config.example" ~/.aws/config
fi

if [[ ! -f ~/.aws/credentials ]] ; then
cp "${WORKSTATION_SETUP_HOME}/files/aws_credentials.example" ~/.aws/credentials
fi
