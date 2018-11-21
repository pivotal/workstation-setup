# Don't stop if docker fails
set +e

# Docker
brew_cask_install_if_missing docker
echo "To get docker command-line tools, run the docker application"

# Docker Bash Completion
# Reference https://docs.docker.com/docker-for-mac/
pushd /usr/local/etc/bash_completion.d
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
popd

set -e
