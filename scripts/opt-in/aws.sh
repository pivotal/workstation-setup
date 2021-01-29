echo
echo "Installing the AWS cli"

brew install awscli

if [[ ! -d ~/.aws ]]] ; then
  mkdir ~/.aws
fi

if [[ ! -f ~/.aws/aws_config ]]] ; then
cp ${WORKSTATION_SETUP_HOME}/files/aws_config.example ~/.aws/aws_config
fi

if [[ ! -f ~/.aws/aws_credentials ]]] ; then
cp ${WORKSTATION_SETUP_HOME}/files/aws_credentials.example ~/.aws/aws_credentials
fi
