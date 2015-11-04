#!/bin/bash

echo "You need to use an image with dev-tools installed on it"
echo "Use Intel's IoT image"
cd
git https://github.com/groeck/i2c-tools.git
cd i2c-tools
cd py-smbus
## This step is very specific to Intel Galileo Poky os
## Before compile & install you have to patch a single line in py-smbus/smbusmodule.c
## There is a constant named I2C_SLAVE but the constant I2C_SLAVE_FORCE is required
sed -i 's/I2C_SLAVE/I2C_SLAVE_FORCE/' smbusmodule.c
cd ..
make EXTRA="py-smbus"
make install
cd py-smbus
python setup.py install
echo "Edit /etc/ld.so.conf to add the line '/usr/local/lib'"
echo "/usr/local/lib" >> /etc/ld.so.conf
ldconfig
echo "Python-smbus has been successfully installed"
echo "Verify this by typing 'import smbus' in python shell"
