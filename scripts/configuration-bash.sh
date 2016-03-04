echo
echo "Configuring bash with bash-it"
brew install grc
brew install coreutils
cp files/dircolors.ansi-dark ~/.dircolors
cp files/.inputrc ~/.inputrc
rm -rf ~/.bash_it
pushd ~/
git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
popd
