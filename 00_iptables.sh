#!/bin/sh

echo "iptables allow/deny setup"

IPTABLES=/sbin/iptables

# rule
$IPTABLES -F

# policy
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD DROP

# loopback address
$IPTABLES -A INPUT -i lo -j ACCEPT

# allow
$IPTABLES -A INPUT -m state --state ESTABLISHED,RELOADED -j ACCEPT

# ping
$IPTABLES -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT

# service
$IPTABLES -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT # SSH
$IPTABLES -A INPUT -p tcp --dport 25 -m state --state NEW -j ACCEPT # SMTP
$IPTABLES -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT # HTTP
$IPTABLES -A INPUT -p tcp --dport 443 -m state --state NEW -j ACCEPT # HTTPS




$IPTABLES -L
pause

echo "service iptables restart"
service iptables save
service iptables restart
