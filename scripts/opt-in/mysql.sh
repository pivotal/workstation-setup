echo "Cloning docker-mysql repo"

if [ ! -d "$WORKSTATION_SETUP_HOME/../docker-mysql" ]
then
  git clone https://github.com/rxrevu/docker-mysql $WORKSTATION_SETUP_HOME/../docker-mysql
else
  echo "docker-mysql directory already exists"
fi

echo "Installing mysql-client"
brew install mysql-client

if ! grep -q "/usr/local/opt/mysql-client/bin" "$HOME/.zshrc"
then
  echo "Adding mysql library path to PATH in .zshrc"
  echo 'export PATH="/usr/local/opt/mysql-client/bin:$PATH"' >> $HOME/.zshrc
else
  echo "mysql is already in PATH"
fi

zsh -c ". $HOME/.zshrc"

echo "Starting mysql docker container"
zsh -c "docker compose -f $WORKSTATION_SETUP_HOME/../docker-mysql/docker-compose.yml up -d"

mysql_container_start_delay=5
echo "Waiting $mysql_container_start_delay seconds for mysql to start"
sleep $mysql_container_start_delay

echo "Setting up mysql user (if connection fails you can try again when container is running)"
zsh -c "mysql -u root -h 127.0.0.1 -e \"CREATE USER IF NOT EXISTS 'test'@'%' IDENTIFIED BY 'test'; GRANT ALL PRIVILEGES ON *.* TO 'test'@'%'; GRANT ALL PRIVILEGES ON *.* TO 'railsuser'@'%';\""
