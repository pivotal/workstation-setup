#!/usr/bin/env zsh
set +e
echo
echo "Installing vim configuration"
pushd ~/
if [ ! -d ~/.vim ]; then
  brew uninstall ctags
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
  curl vimfiles.luan.sh/install | bash
fi
popd
set -e

