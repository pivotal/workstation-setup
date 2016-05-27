echo
echo "Configuring bash with bash-it"
brew install grc
brew install coreutils
cp files/dircolors.ansi-dark ~/.dircolors
cp files/.inputrc ~/.inputrc
rm -rf ~/.bash_it
pushd ~/
git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
popd
cp files/add_user_initials_to_git_prompt_info.bash ~/.bash_it/custom
cp files/bobby_pivotal/bobby_pivotal.theme.bash ~/.bash_it/themes/bobby/bobby.theme.bash
~/.bash_it/install.sh
source ~/.bash_profile
bash-it enable completion git
bash-it enable plugin ssh
