#!/bin/bash

# Program to output a system information in terminal
# With a menu

DELAY=5 # Number of seconds to display the result

report_uptime () {
	echo "System Uptime"
	echo "$(uptime -p) since $(uptime -s)"
	return
}

report_disk_space () {
	echo "Disk Space Utilization"
	echo "$(df -h)"
	return
}

report_home_space () {
	if [[ $(id -u) -eq 0 ]]; then
		echo "Home Space Utilization (All Users)"
		echo "$(du -sh /home/*)"
	else
		echo "Home Space Utilization ($USER)"
		echo "$(du -sh /home/$USER)"
	fi
	return
}

while true; do
	clear
	cat <<- _EOF_
		Please Select:
		1. Display System Information
		2. Display Disk Home
		3. Display Home Space
		0. Quit
	_EOF_
	read -p "Enter selection [0-3] > "
	
	if [[ $REPLY =~ ^[0-3]$ ]]; then	
		if [[ $REPLY == 1 ]]; then
			report_uptime
			sleep $DELAY
			continue
		elif [[ $REPLY == 2 ]]; then
			report_disk_space
			sleep $DELAY
			continue
		elif [[ $REPLY == 3 ]]; then
			report_home_space
			sleep $DELAY
			continue
		elif [[ $REPLY == 0 ]]; then
			break
		fi
	else
		echo "Invalid entry." >&2
		sleep $DELAY
	fi
done
echo "Program terminated."
