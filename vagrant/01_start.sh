#!/usr/bin/env bash
set -ex pipefail
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

TZ=Europe/Berlin
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
locale-gen en_US.UTF-8
echo 'LANG="en_US.UTF-8"' > /etc/default/locale
apt-get -y update && apt-get -y upgrade

source /home/vagrant/workstation-setup/02_install-base.sh
su -c "source /home/vagrant/workstation-setup/03_vagrant-user-config.sh" vagrant
su -c "source /home/vagrant/workstation-setup/04_ui.sh" vagrant
