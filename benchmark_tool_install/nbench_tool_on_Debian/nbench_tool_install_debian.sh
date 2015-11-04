#!/bin/sh

echo "Installation of hardware benchmark tool nbench on Debian os"
cd
apt-get update
apt-get -y install build-essential
wget http://www.tux.org/~mayer/linux/nbench-byte-2.2.3.tar.gz
tar -xvf nbench-byte-2.2.3.tar.gz
cd nbench-byte-2.2.3
sed -i 's/O3/O0/' Makefile
make
echo "nbench has been successfully installed"
echo "Verify this by executing './nbench'"
cd

