#!/bin/sh

wget http://www.sqlite.org/sqlite-autoconf-3070800.tar.gz
tar xvzf sqlite-autoconf-3070800.tar.gz
cd sqlite-autoconf-3070800
./configure
make && make install
