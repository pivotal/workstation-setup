echo
echo "Installing the AWS cli"

brew install awscli

if [[ ! -d ~/.aws ]] ; then
  mkdir ~/.aws
fi

if [[ ! -f ~/.aws/config ]] ; then
cp ${WORKSTATION_SETUP_HOME}/files/aws_config.example ~/.aws/config
fi

if [[ ! -f ~/.aws/credentials ]] ; then
cp ${WORKSTATION_SETUP_HOME}/files/aws_credentials.example ~/.aws/credentials
fi
