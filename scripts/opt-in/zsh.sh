echo "Installing oh-my-zsh"
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
NOW=$(date +"%Y.%m.%d_%H-%M-%S")
cp ~/.zshrc ~/.zshrc.orig."$NOW"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s "$(which zsh)"
echo "source ~/.zshrc.local" >> ~/.zshrc
echo "DISABLE_UPDATE_PROMPT=true" >> ~/.zshrc.local

echo "PATH=/usr/local/bin:${PATH}"

echo "alias git-pull-all='find . -type d -depth 1 -exec git -C {} pull \;'" >> ~/.zshrc.local
echo "alias gpa=git-pull-all" >> ~/.zshrc.local
echo "alias vi=vim" >> ~/.zshrc.local
echo "alias ll='lsd -l'" >> ~/.zshrc.local
echo "alias l='lsd -lah'" >> ~/.zshrc.local
echo "alias dir='lsd -lah'" >> ~/.zshrc.local
echo "alias la='lsd -la'" >> ~/.zshrc.local
echo "alias cat='bat'" >> ~/.zshrc.local

echo "Installing direnv"
brew install direnv
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc.local
echo 'eval "$(mcfly init zsh)"' >> ~/.zshrc.local
# TODO add pairing initials to ZSH
