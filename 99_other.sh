#!/bin/sh

yum -y remove ImageMagick
yum -y install sqlite sqlite-devel ImageMagick ImageMagick-devel
