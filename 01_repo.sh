#!/bin/sh

echo "update centos 5.5 extra repository"
OS=`uname -p`

wget http://download.fedora.redhat.com/pub/epel/5/$OS/epel-release-5-4.noarch.rpm
wget http://rpms.famillecollet.com/el5.$OS/remi-release-5-8.el5.remi.noarch.rpm
wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.$OS.rpm

rpm -Uvh epel-release-5-4.noarch.rpm remi-release-5-8.el5.remi.noarch.rpm rpmforge-release-0.5.2-2.el5.rf.$OS.rpm

vi /etc/yum.repos.d/rpmforge.repo
