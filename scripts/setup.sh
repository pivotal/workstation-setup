#!/bin/bash

clear

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo
echo "You need to agree to the Xcode Software License Agreement"
echo "You will need to enter your password first."
echo "Then, when the agree comes up, press 'q' to jump to the end and then type 'agree' and press return"
echo

sudo xcodebuild -license

echo 
echo "Ensuring you have the latest Homebrew..."

brew update

echo 
echo "Ensuring you have a healthy Homebrew enviroment..."

brew doctor

echo
echo "Ensuring your Homebrew directory is writeable..."

sudo chown -R $(whoami) /usr/local/bin

echo
echo "Installing bash-it"

brew install grc
brew install coreutils
brew install wget
cp files/dircolors.ansi-dark -O ~/.dircolors
cp files/.inputrc ~/.inputrc
cd ~/
rm -rf ~/.bash_it
git clone https://github.com/ahmadassaf/bash-it.git ~/.bash_it
~/.bash_it/install.sh
bash-it enable plugin rbenv


echo
echo "Installing git tools"

brew install git
brew install git-pair

echo
echo "Putting a sample git-pair file in ~/.pairs"
cp files/.pairs ~/.pairs

echo
echo "Installing common applications"

brew cask install flux
brew cask install iterm2
brew cask install google-chrome
brew cask install shiftit
brew cask install macdown
brew cask install slack
brew cask install github-desktop
brew cask install sourcetree
brew cask install screenhero

echo
echo "Installing MacVim and vim configuration"

brew cask install macvim
cd ~/
rm -rf ~/.vim
git clone https://github.com/pivotalcommon/vim-config.git ~/.vim
~/.vim/bin/install

echo
echo "Installing Java Development tools"

brew cask install java
brew cask install intellij-idea
brew install maven
brew install gradle
brew install nexus
brew install jenkins

echo
echo "Installing Ruby tools and Ruby 2.2.3"

brew install ruby
brew install rbenv
rbenv install 2.2.3
gem install bundler
rbenv rehash
brew cask install rubymine

echo
echo "Done!"
