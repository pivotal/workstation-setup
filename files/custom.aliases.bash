# Vüm Specific Aliases

alias daily='bundle && yarn && lint && specs && heroku local'
alias lint='rubocop && npm run eslint .'
alias specs='rails db:migrate && rails db:seed && rails db:test:prepare && rails parallel:prepare && rails parallel:spec'


