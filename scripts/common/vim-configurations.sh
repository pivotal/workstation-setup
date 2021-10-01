#!/usr/bin/env zsh
echo
echo "Installing vim configuration"
pushd ~/
if [ ! -d ~/.vim ]; then
  brew uninstall ctags
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
  brew install nvim
  curl vimfiles.luan.sh/install | FORCE=1 bash
fi
popd

