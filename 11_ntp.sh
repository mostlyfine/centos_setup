#!/bin/sh

yum install -y ntp
ntpdate ntp.nict.jp

echo "server -4 ntp.nict.jp" >> /etc/ntp.conf

/etc/init.d/ntpd start

chkconfig ntpd on
