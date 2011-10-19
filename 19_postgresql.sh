#!/bin/sh


sudo yum erase postgres postgres-server postgres-lib postgres-devel postgres-contrib
sudo yum install postgresql84 postgresql84-contrib postgresql84-devel postgresql84-libs postgresql84-server

/sbin/service postgresql start
sudo -u postgres psql -l
#psql postgres -U postgres -c 'select * from pg_user'

/sbin/chkconfig postgresql on
