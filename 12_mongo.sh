#!/bin/sh

OS=`uname -p`

cat <<EOT > /etc/yum.repos.d/mongo.repo
[10gen]
name=10gen Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/$OS
gpgcheck=0
enabled=0
EOT

#yum --enablerepo=10gen install -y mongodb mongodb-devel mongodb-server
yum --enablerepo=10gen install -y mongodb-10gen mongo-10gen-server
