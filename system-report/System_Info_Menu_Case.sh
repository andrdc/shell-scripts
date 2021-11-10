#!/bin/bash

# System_Info_Menu_Case - Menu driven system information program

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
		A. Display System Information
		B. Display Disk Home
		C. Display Home Space
		Q. Quit
	_EOF_
	read -p "Enter selection [A, B, C or Q] > "
	
	case $REPLY in
		q|Q)	break
				;;
		a|A)	report_uptime
				sleep $DELAY
				continue
				;;
		b|B)	report_disk_space
				sleep $DELAY
				continue
				;;
		c|C)	report_home_space
				sleep $DELAY
				continue
				;;
		*)	echo "Invalid entry" >&2
			exit 1
			;;
	esac
done
echo "Program terminated."
