#!/bin/sh

yum -y --enablerepo=remi,epel,rpmforge install httpd-devel php-devel php-pear mysql-server mysql-client phpmyadmin
