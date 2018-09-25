cat ~/.bash_profile | grep 'rbenv init' || echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

cp files/custom.aliases.bash ~/.bash_it/aliases/enabled/custom.aliases.bash
