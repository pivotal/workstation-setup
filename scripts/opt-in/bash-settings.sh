cat ~/.bash_profile | grep 'rbenv init' || echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

rspec && eslint

echo "#Vüm" >> ~/.bash_it/aliases/enabled/custom.aliases.bash

echo "alias daily='bundle && yarn && lint && specs && heroku local'" >> ~/.bash_it/aliases/enabled/custom.aliases.bash
echo "alias lint='rubocop && npm run eslint .'" >> ~/.bash_it/aliases/enabled/custom.aliases.bash
echo "alias specs='rails db:migrate && rails db:seed && rails db:test:prepare && rails parallel:prepare && rails parallel:spec'
" >> ~/.bash_it/aliases/enabled/custom.aliases.bash
