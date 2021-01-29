echo
echo "Installing the AWS cli"

brew install awscli

mkdir ~/.aws
cp ${WORKSTATION_SETUP_HOME}/files/aws_config.example ~/.aws/aws_config
cp ${WORKSTATION_SETUP_HOME}/files/aws_credentials.example ~/.aws/aws_credentials
