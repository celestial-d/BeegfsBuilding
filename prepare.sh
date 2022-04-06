#!/bin/bash
#
sudo -s
rm /etc/apt/source.list
mv source.list /etc/apt/source.list
apt-get update
apt-get install libcppunit-1.13-0v5
cd v6_my_beegfs_packages/
dpkg -i *.deb
