# Don't stop if docker fails
set +e

# Docker substitute
echo 'Installing Lima instead of docker...'
brew install lima
echo 'Starting Lima for the first time...'
limactl start
echo 'alias docker="lima nerdctl"' >> ~/.zshrc.local
