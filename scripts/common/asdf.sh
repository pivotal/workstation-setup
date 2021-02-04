  if [[ ! -d ~/.asdf ]]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf

    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
    echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
    source "$HOME/.asdf/asdf.sh"
    brew install coreutils
    brew install gpg
  fi
