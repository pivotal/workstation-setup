echo
echo "Setting up .zprofile..."

if [[ ! -f ~/.zprofile ]] ; then
  echo "zprofile does not exist, creating..."
  touch ~/.zprofile
fi

if ! grep -Fxq "#Workstation_alias" ~/.zprofile; then
    echo "Configuring zprofile..."
    printf "%s\\n" "#Workstation_alias" >> ~/.zprofile
    printf "%s\\n" "source ${WORKSTATION_SETUP_HOME}/files/functions.sh" >> ~/.zprofile
    printf "%s\\n" "source ${WORKSTATION_SETUP_HOME}/files/aliases.sh" >> ~/.zprofile

    echo "Configuring direnv"
    if ! brew ls --versions direnv > /dev/null; then
      brew install direnv
    fi
    printf "%s\\n" 'eval "$(direnv hook zsh)"' >> ~/.zprofile

    rxrevu_home="$( cd "${WORKSTATION_SETUP_HOME}/.." >/dev/null 2>&1 && pwd)/rxrevu_web/"
    if [[ "${rxrevu_home}" ]]; then
      printf "%s\\n" "export RX_REVU_HOME=${rxrevu_home}" >> ~/.zprofile
    else
      echo 'no rxrevu home specified skipping RX_REVU_HOME export'
    fi
fi
