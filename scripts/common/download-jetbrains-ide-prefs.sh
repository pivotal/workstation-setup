if [ ! -d ~/workspace/jetbrains-ide-prefs ]; then
    pushd ~/workspace
    echo
    echo "Downloading JetBrains IDE preferences"
    git clone https://github.com/professor/jetbrains-ide-prefs.git
    popd
fi
