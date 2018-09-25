source scripts/helpers/brew.sh

echo
echo "Configuring bash with bash-it"
brew_install_if_missing grc
brew_install_if_missing coreutils
brew_install_if_missing rbenv
brew_install_if_missing watch
cp files/dircolors.ansi-dark ~/.dircolors
cp files/.inputrc ~/.inputrc

BASH_IT_DIRECTORY=$HOME/.bash_it
if [ ! -d $BASH_IT_DIRECTORY ]; then
  echo
  echo "Installing bash_it"
  # for more information see https://github.com/pivotal-cf/git-hooks-core
  git clone https://github.com/Bash-it/bash-it.git $BASH_IT_DIRECTORY
  $BASH_IT_DIRECTORY/install.sh --silent
else
  echo
  echo "Updating bash_it"
  pushd $BASH_IT_DIRECTORY
  git checkout $BASH_IT_DIRECTORY/themes/bobby/bobby.theme.bash
  git pull -r
  popd
fi

cp files/add_user_initials_to_git_prompt_info.bash $BASH_IT_DIRECTORY/custom
cp files/bobby_pivotal/bobby_pivotal.theme.bash $BASH_IT_DIRECTORY/themes/bobby/bobby.theme.bash
source ~/.bash_profile
bash-it enable completion git
bash-it enable plugin ssh
bash-it enable plugin rbenv
bash-it enable completion ssh
bash-it enable alias git

echo
echo "Configuring direnv with bash-it"
brew_install_if_missing direnv
cp files/direnv.bash ~/.bash_it/custom/direnv.bash

