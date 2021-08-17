echo
echo "Installing common Kubernetes tooling"

# install docker to have a container runtime for kubernetes/containers
source ${MY_DIR}/scripts/opt-in/docker.sh

# install minikube to have a kubernetes installation
brew install minikube
brew install kubectl


# Shell completion
FILE=~/.zshrc
if [[ -f "$FILE" ]]; then
    echo "$FILE exists proceeding."
else
    echo "$FILE does not exist, creating."
    touch $FILE
fi

echo 'source <(kubectl completion zsh)' >>~/.zshrc
echo 'alias k=kubectl' >>~/.zshrc
echo 'complete -F __start_kubectl k' >>~/.zshrc
echo 'autoload -Uz compinit' >>~/.zshrc
echo 'compinit' >>~/.zshrc

echo 'eval $(minikube completion $(basename $SHELL))' >> ~/.zshrc.local

