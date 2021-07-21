pushd ~/workspace
if [ ! -d ~/workspace/jetbrains-ide-prefs ]; then
    echo
    echo "Downloading JetBrains IDE preferences"
    git clone https://github.com/professor/jetbrains-ide-prefs.git
fi
popd
