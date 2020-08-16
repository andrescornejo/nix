#!/bin/bash

mou="Mount a device"
umou="Unmount a device"


select=$(echo | awk -va="$mou" -vb="$umou" '{print a"\n"b}' | rofi -dmenu  -i -p "Select an action")

if [ "$select" == "$mou" ] ; then
	mountable=$(lsblk -lp | grep part | grep -v "t /" | awk '{print $1, "(" $4 ")"}')
	mountdrive=$(echo "$mountable" | rofi -dmenu  -i -p "Choose device to mount" | awk '{print $1}'); 
	[[ -z $mountdrive ]] && echo "exiting 1" && exit
	directory=$(find /mnt /media -type d -maxdepth 1 2>/dev/null)
	mountpoint=$(echo "$directory" | rofi -dmenu  -i -p "Choose mounting directory"); 
	[[ -z $mountpoint ]] && echo "exiting 2" && exit
	[[ ! -d "$mountpoint" ]] &&	prompt=$(echo -e "No\nYes" | rofi -dmenu  -i -p  "Create $mountpoint?");
	[[ "$prompt" = No ]] && echo "exiting 3" && exit
	SUDO_ASKPASS=/home/andres/.config/awesome/scripts/password_prompt.sh sudo -A mkdir -p $mountpoint && sudo mount $mountdrive $mountpoint
fi

if [ "$select" == "$umou" ] ; then
	mounted=$(lsblk -lp | grep "t /" | grep -v "\(/boot\|/home\|/\)$" | awk '{print $1, "(" $4 ")", "on", $7}')
	unmountdrive=$(echo "$mounted" | rofi -dmenu  -i -p "Choose device to unmount");
	[[ -z $unmountdrive ]] && echo "exiting 4" && exit
	drive=$(echo $unmountdrive | awk '{print $1}')
	folder=$(echo $unmountdrive | awk '{print $4}')
	SUDO_ASKPASS=/home/andres/.config/awesome/scripts/password_prompt.sh sudo -A umount $drive 
fi
