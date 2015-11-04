#!/bin/bash

echo "fswebcam application installation !!!"
echo "on Intel's official poky image for Intel Galileo"
echo "fswebcam depends on gd library"
echo "Installing the gd library..."
cd
mkdir libs
cd libs
git clone https://bitbucket.org/libgd/gd-libgd.git
#git clone https://github.com/libgd/libgd.git
cd gd-libgd
./bootstrap.sh
./configure
make
make install
echo "Installation of gd library is completed"
cd ..
echo "Installating the fswebcam"
git clone https://github.com/fsphil/fswebcam.git
cd fswebcam
## Edit the makefile to remove --best option from one of the targets
## This step is essential on Poky os for Intel Galileo
sed -i 's/--best//' Makefile.in
./configure --prefix=/usr
make
make install
echo "/usr/local/lib" >> /etc/ld.so.conf
ldconfig
echo "Installation of fswebcam has been completed"
echo "You verify this by executing fswebcam command in terminal of the Galileo"
cd


