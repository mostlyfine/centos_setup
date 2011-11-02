#!/bin/sh

rpm --nosignature -i http://repo.varnish-cache.org/redhat/el5/noarch/varnish-release-2.1-1.noarch.rpm
yum install -y logrotate libgomp gcc cpp binutils kernel-headers glibc-headers glibc-devel expect
yum install -y varnish
