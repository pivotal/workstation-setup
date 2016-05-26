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
mkdir -p ~/.bash_it/completion/enabled
cp ~/.bash_it/completion/available/git.completion.bash ~/.bash_it/completion/enabled/git.completion.bash
~/.bash_it/install.sh
