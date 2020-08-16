#!/bin/bash

sus="Suspend"
power="Power Off"
rebo="Reboot"
lock="Lock PC"


option=$(echo | awk -va="$sus" -vb="$power" -vc="$rebo" -vd="$lock" '{print a"\n"b"\n"c"\n"d}' | rofi -dmenu -i -p "System")

if [ "$option" == "$sus" ] ; then
	systemctl suspend
elif [ "$option" == "$lock" ] ; then
	mpc pause && dm-tool lock
elif [ "$option" == "$rebo" ] ; then 
	reboot
elif [ "$option" == "$power" ] ; then
	poweroff
else
echo $option
fi
