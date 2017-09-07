#!/bin/bash

pushd /tmp
curl https://raw.githubusercontent.com/kcrawford/dockutil/master/scripts/dockutil > dockutil
chmod u+x,go-rwx dockutil
./dockutil --list | awk -F\t '{print "./dockutil --remove \""$1"\""}' | sh
rm -f dockutil
popd
