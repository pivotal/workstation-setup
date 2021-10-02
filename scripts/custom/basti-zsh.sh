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

cp files/dircolors.ansi-dark $HOME/.dircolors

echo "Installing zsh-autosuggestions"
brew install zsh-autosuggestions

# avoid duplicate sourcing of .zshrc.local and ensure it is last
grep -v .zshrc.local $HOME/.zshrc > /tmp/zshrc.tmp && mv /tmp/zshrc.tmp $HOME/.zshrc 
echo "source ~/.zshrc.local" >> $HOME/.zshrc

cat <<EOF > ~/.zshrc.local
DISABLE_UPDATE_PROMPT=true
PATH=\$HOME/.cargo/bin:\$HOME/bin:/usr/local/bin:\${PATH}

ASPATH=/usr/local/share/zsh-autosuggestions
if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  ASPATH=/usr/share/zsh-autosuggestions
fi
source \$ASPATH/zsh-autosuggestions.zsh

EDITOR='nvim'

alias git='git-together'
alias git-pull-all='find . -type d -depth 1 -exec git -C {} pull \;'
alias gpa=git-pull-all
alias vi=vim
alias ll='lsd -l'
alias l='lsd -lah'
alias dir='lsd -lah'
alias la='lsd -la'
alias z="zoxide"
alias vi=nvim

# disable FZF keybinding for history (ctrl-r) even if initialized in other file in favor for mcfly
bindkey -r "^R"
rg --passthru -N "bindkey '\^R' fzf-history-widget" -r "# bindkey '^R' fzf-history-widget" \$HOME/.fzf/shell/key-bindings.zsh > \$HOME/.fzf/shell/key-bindings.without-history.zsh

[ -f \$HOME/.fzf/shell/key-bindings.without-history.zsh ] && source \$HOME/.fzf/shell/key-bindings.without-history.zsh
eval "\$(direnv hook zsh)"
eval "\$(zoxide init zsh)"
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

# this must be after the prompt command, as autojump uses the prompt to work
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

EOF

read -r -p "Would you like to change your oh-my-zsh theme? Please enter name or press Enter (Default/n = no change) " THEME_NAME
if [[ -n $THEME_NAME ]] || [[ $THEME_NAME == "n" ]]
then
  sed -i '' -e "s/ZSH_THEME=\".*$/ZSH_THEME=\"$THEME_NAME\"/g" ~/.zshrc
fi
echo "You can find your custom zsh config in ~/.zshrc.local"
