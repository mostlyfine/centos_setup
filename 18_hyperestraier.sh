#!/bin/sh

wget http://ftp.yz.yamagata-u.ac.jp/pub/GNU/libiconv/libiconv-1.13.1.tar.gz
tar xvzf libiconv-1.13.1.tar.gz
cd libiconv-1.13.1
./configure
make && make install

cd ..
wget http://fallabs.com/qdbm/qdbm-1.8.78.tar.gz
tar xvzf qdbm-1.8.78.tar.gz
cd qdbm-1.8.78
./configure --enable-zlib
make && make install

cd ..
wget http://fallabs.com/hyperestraier/hyperestraier-1.4.13.tar.gz
tar xvzf hyperestraier-1.4.13.tar.gz
cd hyperestraier-1.4.13
./configure
make && make install
