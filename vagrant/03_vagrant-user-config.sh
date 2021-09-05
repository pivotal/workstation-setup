#!/usr/bin/env bash
set -e pipefail
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


# zsh
echo "Installing oh-my-zsh"
OH_DIR=~/.oh-my-zsh
NOW=$(date +"%Y.%m.%d_%H-%M-%S")

# backup local config
[[ -f ~/.zshrc.local ]] && cp ~/.zshrc.local ~/.zshrc.local."$NOW"

# install oh-my-zsh, but respect existing installation
if [[ ! -d $OH_DIR ]]
then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $OH_DIR
  [[ -f ~/.zshrc ]] && cp ~/.zshrc ~/.zshrc.orig."$NOW"
  cp $OH_DIR/templates/zshrc.zsh-template ~/.zshrc
fi

echo "source ~/.zshrc.local" >> ~/.zshrc

cp "$SCRIPT_DIR"/files/dircolors.ansi-dark ~/.dircolors

echo
if [[ ! -f ~/.git-together ]]
then
  echo "Putting a sample git-together file in ~/.git-together"
  cp "$SCRIPT_DIR"/files/.git-together ~/.git-together
fi

echo
echo "Setting global Git configurations"
git config --global core.editor /usr/local/bin/vim
git config --global transfer.fsckobjects true
git config --global --add include.path ~/.git-together

mkdir -p ~/.git_templates
git config --global init.templateDir ~/.git_templates
echo "ref: refs/heads/main" > ~/.git_templates/HEAD

HOOKS_DIRECTORY=$HOME/workspace/git-hooks-core
if [ ! -d $HOOKS_DIRECTORY ]; then
  mkdir -p ~/workspace/
  echo
  echo "Installing git hooks for cred-alert"
  # for more information see https://github.com/pivotal-cf/git-hooks-core
  git clone https://github.com/pivotal-cf/git-hooks-core $HOOKS_DIRECTORY
  git config --global --add core.hooksPath $HOOKS_DIRECTORY
else
  echo
  echo "Updating git-hooks for cred-alert"
  pushd $HOOKS_DIRECTORY
  git pull -r
  popd
fi

# install cred-alert-cli
os_name=$(uname | awk '{print tolower($1)}')
curl -L -o cred-alert-cli \
  https://github.com/pivotal-cf/cred-alert/releases/latest/download/cred-alert-cli_${os_name}
chmod 755 cred-alert-cli
mkdir -p "$HOME"/bin
mv cred-alert-cli "$HOME"/bin # <= or other directory in ${PATH}

# install some tools from source
set +e
[[ ! -f ~/.cargo/bin/git-together ]] && cargo install --git https://github.com/kejadlen/git-together.git --branch master git-together # git-together for pairing
[[ ! -f ~/.cargo/bin/mcfly ]] && cargo install --git https://github.com/cantino/mcfly.git --branch master mcfly # mcfly shell history
set -e

echo
if [[ ! -d "$HOME/.sdkman" ]]
then
  echo "Installing sdkman"
  curl -s "https://get.sdkman.io?rcupdate=false" | bash
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk install java
fi


# install latest version

cat <<EOF > ~/.zshrc.local
DISABLE_UPDATE_PROMPT=true
PATH=/usr/local/bin:\${PATH}:\$HOME/.cargo/bin/:\$HOME/bin
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# add git-together pairing credentials to prompt
function pairing_initials {
  if [[ \$(git rev-parse --is-inside-work-tree 2>/dev/null) == "true" ]]
  then
    GIT_TOGETHER=\$(git config git-together.active)
    echo "[\$GIT_TOGETHER] "
  else
    echo ""
  fi
}

export PROMPT='%{%F{2}%}\$(pairing_initials)%{\${reset_color}%}'\$PROMPT

eval "\$(zoxide init zsh)"
eval "\$(mcfly init zsh)"
eval "\$(direnv hook zsh)"

alias git='git-together'
alias git-pull-all='find . -type d -depth 1 -exec git -C {} pull \;'
alias gpa=git-pull-all
alias vi=vim
alias ll='lsd -l'
alias l='lsd -lah'
alias dir='lsd -lah'
alias la='lsd -la'
alias j="autojump"
alias bat='batcat'
[[ -s "\$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "\$HOME/.sdkman/bin/sdkman-init.sh"
EOF

