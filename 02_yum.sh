#!/bin/sh

echo "yum update"

yum -y update
yum -y install gcc gcc44 gcc44-c++
yum -y install ncurses-devel pcre-devel zlib-devel openssl-devel readline-devel bzip2-devel libtool build-essential
yum -y --enablerepo=remi,epel,rpmforge install git-core zsh screen vim curl lv ctags
