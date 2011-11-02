#!/bin/sh

#rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-3.0/el5/noarch/varnish-release-3.0-1.noarch.rpm
#yum install -y logrotate libgomp gcc cpp binutils kernel-headers glibc-headers glibc-devel expect

yum install -y pcre-devel expect
yum install -y ncurses-devel automake autoconf libtool libxslt groff pkgconfig

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
