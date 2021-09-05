#!/usr/bin/env bash
if [[ ! $(basename "$SHELL") == "zsh" ]]
then
  chsh -s "$(which zsh)" vagrant
fi
