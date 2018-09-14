# Vüm Specific Aliases

alias daily='bundle && yarn && rails voom:open voom:refresh && lint && specs && heroku local'
alias lint='rubocop && yarn eslint .'
alias specs='rails db:migrate && rails db:seed && rails db:test:prepare && rails parallel:prepare && rails parallel:spec'


