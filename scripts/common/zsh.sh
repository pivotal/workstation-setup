echo "Installing oh-my-zsh"
OH_DIR=~/.oh-my-zsh
if [[ ! -d $OH_DIR ]]
then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $OH_DIR
fi
NOW=$(date +"%Y.%m.%d_%H-%M-%S")
cp ~/.zshrc ~/.zshrc.orig."$NOW"
cp ~/.zshrc.local ~/.zshrc.local."$NOW"
cp $OH_DIR/templates/zshrc.zsh-template ~/.zshrc
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
alias cat='bat'
eval "\$(direnv hook zsh)"
eval "\$(mcfly init zsh)"

# add git-together pairing credentials to prompt
export PROMPT=\$PROMPT'%F{2}\$(git config git-together.active) %F{253}$ '

EOF
echo "You can find your custom zsh config in ~/.zshrc.local"
