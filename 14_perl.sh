#!/bin/sh

curl -LOk http://xrl.us/cpanm
chmod +x cpanm
mv cpanm /usr/local/bin
cpanm --self-upgrade
cpanm local::lib
