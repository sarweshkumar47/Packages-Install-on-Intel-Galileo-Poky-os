#!/bin/sh

echo "Installation of hardware benchmark tool nbench on Poky os"
cd
wget http://www.tux.org/~mayer/linux/nbench-byte-2.2.3.tar.gz
tar -xvf nbench-byte-2.2.3.tar.gz
cd nbench-byte-2.2.3
sed -i 's/-static//' Makefile
make
echo "nbench has been successfully installed"
echo "Verify this by executing './nbench'"
cd

