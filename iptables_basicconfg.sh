#!/bin/bash

if [[ "${UID}" -ne 0 ]]
then
 echo 'Must execute with sudo or root' >&2
 exit 1
fi

echo "PermitRootLogin no" >> /etc/ssh/sshd_config 

sudo iptables -F
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 5432 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 3380 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 48080 -j ACCEPT	
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 3608 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -P INPUT DROP
sudo netfilter-persistent save
sudo netfilter-persistent reload