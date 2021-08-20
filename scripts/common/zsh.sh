echo "Installing oh-my-zsh"
OH_DIR=~/.oh-my-zsh
NOW=$(date +"%Y.%m.%d_%H-%M-%S")

# backup local config
cp ~/.zshrc.local ~/.zshrc.local."$NOW"

# install oh-my-zsh, but respect existing installation
if [[ ! -d $OH_DIR ]]
then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $OH_DIR
  cp ~/.zshrc ~/.zshrc.orig."$NOW"
  cp $OH_DIR/templates/zshrc.zsh-template ~/.zshrc
fi

if [[ ! $(basename "$SHELL") == "zsh" ]]
then
  chsh -s "$(which zsh)"
fi

echo "source ~/.zshrc.local" >> ~/.zshrc

cp files/dircolors.ansi-dark ~/.dircolors
cp files/.inputrc ~/.inputrc

echo "Installing direnv"
brew install direnv

cat <<EOF > ~/.zshrc.local
DISABLE_UPDATE_PROMPT=true
PATH=/usr/local/bin:\${PATH}

alias git='git-together'
alias git-pull-all='find . -type d -depth 1 -exec git -C {} pull \;'
alias gpa=git-pull-all
alias vi=vim
alias ll='lsd -l'
alias l='lsd -lah'
alias dir='lsd -lah'
alias la='lsd -la'
eval "\$(direnv hook zsh)"
eval "\$(mcfly init zsh)"

# add git-together pairing credentials to prompt
function pairing_initials {
  if [[ \$(git rev-parse --is-inside-work-tree 2>/dev/null) == "true" ]]
  then
    GIT_TOGETHER=\$(git config git-together.active)
    echo -e "[\$GIT_TOGETHER] "
  else
    echo -e ""
  fi
}

export PROMPT='%{%F{2}%}\$(pairing_initials)%{\${reset_color}%}'\$PROMPT

EOF
read -r -p "Would you like to change your oh-my-zsh theme? Please enter name or press Enter (Default/n = no change) " THEME_NAME
if [[ -n $THEME_NAME ]] || [[ $THEME_NAME == "n" ]]
then
  sed -i '' -e "s/ZSH_THEME=\".*$/ZSH_THEME=\"$THEME_NAME\"/g" ~/.zshrc
fi
echo "You can find your custom zsh config in ~/.zshrc.local"
