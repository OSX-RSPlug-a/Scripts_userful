#!/bin/bash

while true; do
 clear
 echo "System Resource Monitoring"
 echo "--------------------------"

 echo "Show the hostname"
 hostname

 echo "Today data"
 date

 echo "kernel version"
 uname -a

 echo "CPU Usage:"
 top -n 1 -b | grep "Cpu"

 echo -e "\nMemory Usage:"
 free -h

 echo -e "\nDisk Space Usage:"
 df -h

 sleep 5
done