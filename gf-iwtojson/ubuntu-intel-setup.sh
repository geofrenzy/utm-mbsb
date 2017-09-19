#!/bin/bash

apt-get install libnl-3-200
apt-get install libnl-genl-3-200
apt-get install libnl-route-3-200

echo
echo "-adding missing symlink-"

cd /lib/x86_64-linux-gnu/
ln -s libnl-genl-3.so.200  libnl-genl-3.so
