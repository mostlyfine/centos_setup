#!/bin/sh

# see http://sabo.posterous.com/varnish-2

yum erase libtool
rpm -i http://dl.atrpms.net/el5-i386/atrpms/testing/libtool-2.2.6-15.5.el5.1.i386.rpm

yum install -y pcre-devel expect
yum install -y ncurses-devel automake autoconf libxslt groff pkgconfig

wget http://repo.varnish-cache.org/source/varnish-3.0.2.tar.gz
tar xvzf varnish-3.0.2.tar.gz
cd varnish-3.0.2
./autogen.sh
./configure --prefix /usr/local/varnish --enable-debugging-symbols
make && make install

#cp redhat/varnish.initrc /etc/init.d/varnish
#cp redhat/varnish.logrotate /etc/logrotate.d/varnish
#cp redhat/varnish.sysconfig /etc/sysconfig/varnish
#cp redhat/varnishlog.initrc /etc/init.d/varnishlog
#cp redhat/varnishncsa.initrc /etc/init.d/varnishncsa
#cp etc/default.vcl /usr/local/varnish/etc/default.vcl
#
#chkconfig -add varnish
#chkconfig -add varnishncsa
#chkconfig -add varnishlog
#chkconfig -level 2345 varnish on
#chkconfig -level 2345 varnishncsa on
#chkconfig -level 2345 varnishlog on
