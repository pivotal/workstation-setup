#!/usr/bin/env bash

# Don't stop if install fails
set +e
echo
echo "Installing git-cola"
brew install sphinx-doc
brew install git-cola
make \
    PYTHON=$(brew --prefix python3)/bin/python3 \
    PYTHON_CONFIG=$(brew --prefix python3)/bin/python3-config \
    SPHINXBUILD=$(brew --prefix sphinx-doc)/bin/sphinx-build \
    git-cola.app
rm -fr /Applications/git-cola.app && cp -r git-cola.app /Applications
set -e
