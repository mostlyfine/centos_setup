#!/bin/sh

getenforce
setenforce 0
echo "SELINUX=disabled" > /etc/sysconfig/selinux
