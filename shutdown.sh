#!/bin/bash
# Shutdown and restart prog

while true
do
clear
echo -e "
	1 - Shutdown
	2 - Restart
	3 - Cancel"
echo -n " 
	Choose ur op: "
read OPT
echo ""
case $OPT in

	1)init 0
	exit 0
	;;
	2)init 6 
	exit 0
	;;
	3)echo " Cancel "
	exit 0
	;;
	*)echo "Cancel it" 
	wait 3, exit
	;;
esac
done
