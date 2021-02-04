echo
echo "Installing oh_my_zsh..."

curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# switch the shell to zsh
if [[ "${CHSH}" != "no" ]]; then
  chsh -s $(which zsh)
fi
