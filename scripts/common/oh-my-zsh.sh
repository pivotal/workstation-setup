echo

# Don't exit if oh-my-zsh fails
set +e

echo "Installing Oh My Zsh (and don't exit if it's already installed)"
ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

echo "Ignoring insecure completion-dependent directories."
echo "Needed when multiple admin users are using oh-my-zsh."
echo "

# Ignoring insecure completion-dependent directories.
# Needed when multiple admin users are using oh-my-zsh.
ZSH_DISABLE_COMPFIX=true

" >> ~/.zshenv

set -e
