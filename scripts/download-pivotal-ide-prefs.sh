pushd ~/workspace
if [ ! -d ~/workspace/pivotal_ide_prefs ]; then
    echo
    echo "Downloading Pivotal IDE preferences"
    git clone https://github.com/pivotal/pivotal_ide_prefs.git
fi
popd
