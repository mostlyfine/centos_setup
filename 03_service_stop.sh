#!/bin/sh

echo "service stop"

chkconfig auditd off
chkconfig acpid off
chkconfig anacron off
chkconfig atd off
chkconfig autofs off
chkconfig avahi-daemon off
chkconfig bluetooth off
#chkconfig cups off
chkconfig firstboot off
chkconfig gpm off
chkconfig haldaemon off
chkconfig hidd off
chkconfig isdn off
chkconfig kudzu off
chkconfig lvm2-monitor off
chkconfig mcstrans off
chkconfig mdmonitor off
chkconfig messagebus off
chkconfig netfs off
chkconfig nfslock off
chkconfig pcscd off
chkconfig portmap off
chkconfig rawdevices off
chkconfig restorecond off
chkconfig rpcgssd off
chkconfig rpcidmapd off
chkconfig smartd off
chkconfig xfs off
chkconfig yum-updatesd off
