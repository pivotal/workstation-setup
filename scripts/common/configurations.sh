echo
echo "Configuring iTerm"
cp files/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Configuring FlyCut"
open /Applications/Flycut.app

echo
echo "Installing vim configuration"
pushd ~/
if [ ! -d ~/.vim ]; then
    git clone https://github.com/pivotal/vim-config.git ~/.vim
    ~/.vim/bin/install
fi
popd


