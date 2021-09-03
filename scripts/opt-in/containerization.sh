# Don't stop if docker fails
set +e

# Docker substitute
echo 'Installing Lima instead of docker...'
brew install lima
echo 'Starting Lima for the first time...'
limactl start
cat <<EOF >> ~/.zshrc.local
alias docker="lima nerdctl"
limactl start
EOF
set -e
