source scripts/helpers/brew.sh

echo
echo "Configuring bash with bash-it"
brew_install_if_missing grc
brew_install_if_missing coreutils
brew_install_if_missing rbenv
brew_install_if_missing watch
cp files/dircolors.ansi-dark ~/.dircolors
cp files/.inputrc ~/.inputrc
rm -rf ~/.bash_it
git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
cp files/add_user_initials_to_git_prompt_info.bash ~/.bash_it/custom
cp files/bobby_pivotal/bobby_pivotal.theme.bash ~/.bash_it/themes/bobby/bobby.theme.bash
~/.bash_it/install.sh --silent
source ~/.bash_profile
# bash-it enable completion git
# bash-it enable plugin ssh
# bash-it enable plugin rbenv
# bash-it enable completion ssh
# bash-it enable alias git

echo
echo "Configuring direnv with bash-it"
brew_install_if_missing direnv
cp files/direnv.bash ~/.bash_it/custom/direnv.bash

