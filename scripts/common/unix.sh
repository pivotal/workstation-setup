#!/usr/bin/env sh

echo
echo "Installing utilities for unix development"

# For users of unixes
# process tree
brew install pstree
# grep replacement. `ag` on the commandline. https://github.com/ggreer/the_silver_searcher
brew install the_silver_searcher
# Cli HTTP client. Similar to `curl` but recursive
brew install wget

# Other useful command-line tools for RxRevu
# Man page replacement. `tldr` on the commmand line. https://github.com/dbrgn/tealdeer
brew install tealdeer
# GNU's version of sed
brew install gnu-sed
# CLI for postman
brew install newman
# JSON query utility. https://stedolan.github.io/jq/
brew install jq
# JSON diff https://github.com/josephburnett/jd
brew install jd
