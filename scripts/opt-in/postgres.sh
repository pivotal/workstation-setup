echo "Cloning docker-postgres repo"

if [ ! -d "$WORKSTATION_SETUP_HOME/../docker-postgres" ]
then
  git clone git@github.com:rxrevu/docker-postgres.git $WORKSTATION_SETUP_HOME/../docker-postgres
else
  echo "docker-postgres directory already exists"
fi

echo "Installing postgres client"
brew install libpq

postgres_bin_path="/usr/local/opt/libpq/bin"

if ! grep -q $postgres_bin_path "$HOME/.zshrc"
then
  echo "Adding postgres library path to PATH in .zshrc"
  echo "export PATH=\"$postgres_bin_path:\$PATH\"" >> ~/.zshrc
else
  echo "postgres is already in PATH"
fi

echo "Starting postgres docker container"
zsh -c "docker compose -f $WORKSTATION_SETUP_HOME/../docker-postgres/docker-compose.yml up -d"

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "${GREEN}Postgres should be running in docker now, source your ~/.zshrc file and connect to postgres
using 'psql -h localhost -U postgres -W and use password from docker-postgres/.env/development/database file.$NC"
