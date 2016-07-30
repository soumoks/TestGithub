#!/bin/bash
#Check if usb drive is mounted

if (cat /proc/mounts | cut -d ' ' -f1 | grep -q -i "/dev/sda1");  then
	echo "USB drive is mounted"
	#run rsync
	echo "backing home folder to /media/usb1/shared/Home_folder_Daily_Backup"
	rsync -a  /home/pi/ /media/usb1/shared/Home_folder_Daily_Backup
else
	echo "need to mount"
	echo "mounting ..."
	#first mount the drive and then run rsync
	sudo mount -t auto -o uid=1000,gid=1000 /dev/sda1/ /media/usb1
	echo "backing home folder to /media/usb1/shared/Home_folder_Daily_Backup"
	rsync -a  /home/pi/ /media/usb1/shared/Home_folder_Daily_Backup
fi

