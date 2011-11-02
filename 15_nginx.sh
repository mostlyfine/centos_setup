#!/bin/sh

#
# configure via http://wiki.nginx.org/NginxModules
#

yum install gcc openssl-devel pcre-devel zlib-devel
useradd -s /sbin/nologin -d /usr/local/nginx -M nginx

wget http://nginx.org/download/nginx-1.1.7.tar.gz
tar xvzf nginx-1.1.7.tar.gz
cd nginx-1.1.7
./configure \
  --conf-path=/etc/nginx/nginx.conf \
  --pid-path=/var/run/nginx/nginx.pid  \
  --lock-path=/var/lock/nginx.lock \
  --http-log-path=/var/log/nginx/access.log \
  --error-log-path=/var/log/nginx/error.log \
  --user=nginx \
  --group=nginx \
  --with-http_stub_status_module \
  --with-http_ssl_module \
  --with-http_gzip_static_module \
  --with-http_realip_module \
  --with-http_fastcgi_module \
  --with-http_perl_module \
  --http-client-body-temp-path=/var/tmp/nginx/client/ \
  --http-proxy-temp-path=/var/tmp/nginx/proxy/ \
  --http-fastcgi-temp-path=/var/tmp/nginx/fcgi/

make && make install

mkdir -p /var/tmp/nginx/{proxy,client,fcgi}
chown -R nginx:nginx /usr/local/nginx


cat <<_EOT_ > /etc/init.d/nginx
#!/bin/sh
#
# nginx - this script starts and stops the nginx daemon
#
# chkconfig:   - 85 15 
# description:  Nginx is an HTTP(S) server, HTTP(S) reverse
#               proxy and IMAP/POP3 proxy server
# processname: nginx
# config:      /etc/nginx/nginx.conf
# config:      /etc/sysconfig/nginx
# pidfile:     /var/run/nginx.pid
 
# Source function library.
. /etc/rc.d/init.d/functions
 
# Source networking configuration.
. /etc/sysconfig/network
 
# Check that networking is up.
[ "\$NETWORKING" = "no" ] && exit 0
 
nginx="/usr/local/nginx/sbin/nginx"
prog=\$(basename \$nginx)
 
NGINX_CONF_FILE="/etc/nginx/nginx.conf"
 
[ -f /etc/sysconfig/nginx ] && . /etc/sysconfig/nginx
 
lockfile=/var/lock/nginx.lock
 
make_dirs() {
   # make required directories
   user=\`\$nginx -V 2>&1 | grep "configure arguments:" | sed 's/[^*]*--user=\([^ ]*\).*/\1/g' -\`
   if [ -z "\`grep \$user /etc/passwd\`" ]; then
       useradd -M -s /bin/nologin \$user
   fi
   options=\`$nginx -V 2>&1 | grep 'configure arguments:'\`
   for opt in \$options; do
       if [ \`echo \$opt | grep '.*-temp-path'\` ]; then
           value=\`echo \$opt | cut -d "=" -f 2\`
           if [ ! -d "\$value" ]; then
               # echo "creating" \$value
               mkdir -p \$value && chown -R \$user \$value
           fi
       fi
   done
}
 
start() {
    [ -x \$nginx ] || exit 5
    [ -f \$NGINX_CONF_FILE ] || exit 6
    make_dirs
    echo -n \$"Starting \$prog: "
    daemon \$nginx -c \$NGINX_CONF_FILE
    retval=\$?
    echo
    [ \$retval -eq 0 ] && touch \$lockfile
    return \$retval
}
 
stop() {
    echo -n \$"Stopping \$prog: "
    killproc \$prog -QUIT
    retval=\$?
    echo
    [ \$retval -eq 0 ] && rm -f \$lockfile
    return \$retval
}
 
restart() {
    configtest || return \$?
    stop
    sleep 1
    start
}
 
reload() {
    configtest || return \$?
    echo -n \$"Reloading \$prog: "
    killproc \$nginx -HUP
    RETVAL=\$?
    echo
}
 
force_reload() {
    restart
}
 
configtest() {
  \$nginx -t -c \$NGINX_CONF_FILE
}
 
rh_status() {
    status \$prog
}
 
rh_status_q() {
    rh_status >/dev/null 2>&1
}
 
case "\$1" in
    start)
        rh_status_q && exit 0
        \$1
        ;;
    stop)
        rh_status_q || exit 0
        \$1
        ;;
    restart|configtest)
        \$1
        ;;
    reload)
        rh_status_q || exit 7
        \$1
        ;;
    force-reload)
        force_reload
        ;;
    status)
        rh_status
        ;;
    condrestart|try-restart)
        rh_status_q || exit 0
            ;;
    *)
        echo \$"Usage: \$0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload|configtest}"
        exit 2
esac
_EOT_

chmod 755 /etc/init.d/nginx
/sbin/chkconfig --add nginx
/sbin/chkconfig nginx on

cat <<EOT > /etc/logrotate.d/nginx
/var/log/nginx/*log {
    missingok
    notifempty
    delaycompress
    sharedscripts
    postrotate
        /usr/local/nginx/sbin/nginx -s reopen
    endscript
}
EOT
#logrotate -d /etc/logrotate.conf
