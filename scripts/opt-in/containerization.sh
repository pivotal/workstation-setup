# Don't stop if docker fails
set +e

# Docker substitute
echo 'Installing Lima instead of docker...'
brew install lima
echo 'Starting Lima for the first time...'
limactl start
cat <<EOF >> ~/.zshrc.local
alias docker="lima nerdctl"
echo
echo
echo "Starting Lima VM... please wait..."
echo
limactl start
bashcompinit
eval "\$(limactl completion bash)"
EOF
set -e
