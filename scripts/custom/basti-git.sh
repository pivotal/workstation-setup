#!/usr/bin/env zsh

git config --global core.editor "vi"
git config --global core.autocrlf input

if [[ $(command -v delta) ]]; then
cat <<EOF >> ~/.gitconfig
[pager]
    diff = delta
    log = delta
    reflog = delta
    show = delta

[interactive]
    diffFilter = delta --color-only --features=interactive
EOF
fi
