#!/bin/sh

rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-3.0/el5/noarch/varnish-release-3.0-1.noarch.rpm
yum install -y logrotate libgomp gcc cpp binutils kernel-headers glibc-headers glibc-devel expect
