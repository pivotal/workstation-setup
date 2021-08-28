echo
echo "Installing vim configuration"
pushd ~/
if [ ! -d ~/.vim ]; then
    git clone https://github.com/pivotal/vim-config.git ~/.vim
    ~/.vim/bin/install
    echo "let g:snipMate = { 'snippet_version' : 1 }" >> ~/.vim/vimrc
fi
popd


