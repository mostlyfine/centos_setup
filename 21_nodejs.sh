#!/bin/sh

yum install -y gcc-c++ openssl-devel

git clone git://github.com/ry/node.git
cd node
./configure
make && make install

chown -R $USER /usr/local
curl http://npmjs.org/install.sh | sh
chown -R root /usr/local

export PATH=$PATH:/usr/loca/bin

npm install mongodb
npm install mysql
npm install express
npm install socket.io
npm install ejs
