echo
if [[ ! -d "$HOME/.sdkman" ]]
then
  echo "Installing sdkman"
  curl -s "https://get.sdkman.io?rcupdate=false" | bash
  # shellcheck disable=SC2016
  echo '[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"' >> ~/.zshrc.local
  cp files/sdkman.bash ~/.bash_it/custom/sdkman.bash
fi

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# install latest version
sdk install java
# install java 8
sdk install java $(sdk ls java |grep 8.0|grep hs-adpt|cut -d\| -f6)

source ${MY_DIR}/scripts/opt-in/java-tools.sh
