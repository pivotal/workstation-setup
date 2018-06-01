#!/bin/sh

curl https://codeload.github.com/pivotaltracker/workstation-setup/zip/master >workstation-setup.zip
unzip workstation-setup.zip
mv workstation-setup-master workstation-setup
rm workstation-setup.zip
