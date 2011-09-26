#!/bin/sh

yum remove mysql mysql-server mysql-libs
yum --enablerepo=remi install -y mysql-server
mysql_install_db
chown -R mysql:mysql /var/lib/mysql
/etc/init.d/mysqld restart
chkconfig mysqld on
