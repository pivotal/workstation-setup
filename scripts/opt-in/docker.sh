# Don't stop if docker fails
set +e

# Docker
brew install --cask docker
echo "To get docker command-line tools, run the docker application"

# Docker Zsh Completion
# Reference https://docs.docker.com/docker-for-mac/
etc=/Applications/Docker.app/Contents/Resources/etc
ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-composepopd

set -e
