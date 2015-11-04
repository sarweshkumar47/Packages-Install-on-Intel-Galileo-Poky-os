#!/bin/bash

echo "Cron service application installation !!!"
echo "on Intel's official poky image for Intel Galileo"
cd
git clone https://git.fedorahosted.org/git/cronie.git
cd cronie
./autogen.sh
./configure
make
make install
mkdir -p /usr/local/var/spool/cron
cp cron_startup_script/crond /etc/init.d/
update-rc.d crond defaults
echo "Cron application has been successfully installed"
echo "Verify the cron service by executing 'ps | grep cron'"
