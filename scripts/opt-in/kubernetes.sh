echo
echo "Installing common Kubernetes tooling"

# install docker to have a container runtime for kubernetes/containers
source ${WORK_DIR}/scripts/opt-in/docker.sh

# as docker now is propriertary, let's run minikube on virtualbox
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack

# install minikube to have a kubernetes installation
brew install minikube

# Shell completion
FILE=~/.zshrc.local
if [[ -f "$FILE" ]]; then
    echo "$FILE exists proceeding."
else
    echo "$FILE does not exist, creating."
    touch $FILE
fi

echo 'source <(kubectl completion zsh)' >>$FILE
echo 'alias k=kubectl' >> $FILE
echo 'complete -F __start_kubectl k' >>$FILE
echo 'autoload -Uz compinit' >>$FILE
echo 'compinit' >>$FILE

echo 'eval $(minikube completion $(basename $SHELL))' >> $FILE

