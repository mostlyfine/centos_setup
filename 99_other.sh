#!/bin/sh

yum -y remove ImageMagick
yum -y install sqlite sqlite-devel ImageMagick ImageMagick-devel
yum -y install memcached
yum -y install colordiff
