#!/bin/bash

# Auto_Backup : Script to execute an automatic backup in another hard drive.

username=$1

PROGNAME=$(basename $0)
DEFAULT_SOURCE_DIR="/home/$username/Documents/"
DEFAULT_DEST_DIR="/media/$username/Backup/"

source_directory="/home/$username/Documents/" # Default source directory
destination_directory="/media/$username/Backup/" # Default destination directory
device="/dev/sda" # Default devide
device_partition_to_mount="/dev/sda1" # Default device partition to mount

usage(){
	echo -e "$PROGNAME:\n\nusage: $PROGNAME [-f from_directory to_directory | -d device_partition_to_mount]"
	echo -e "\n\tIf no directories specified, the default directories would be:\n\t\t'$source_directory' as the source directory.\n\t\t'$destination_directory' as the destination directory."
	echo -e "\n\tIf no device partiton to mount is specified then:\n\t\t'$device' would be the default device.\n\t\t'$device_partition_to_mount' would be the device partition."
	return
}

check_Directories(){
	if [[ ! -d $source_directory ]]; then
		echo "Directory '$source_directory' does not exists." >&2
		exit 1
	elif [[ ! -d $destination_directory ]]; then
		echo "OK"
		if [[ "$destination_directory" == "$DEFAULT_DEST_DIR" ]]; then
			echo "Creating destination directory '$destination_directory' ..."
			$(sudo mkdir $destination_directory)
			echo "Destination directory '$destination_directory' created!."
		else
			echo "Directory '$destination_directory' does not exists." >&2
			exit 1
		fi
	fi
}

mount_Device(){
	echo "Mounting device '$device_partition_to_mount' into '$destination_directory' ..."
	$(sudo mount $device_partition_to_mount $destination_directory)
	echo "Device '$device_partition_to_mount' successfully mounted into '$destination_directory'."
}

make_Backup(){
	echo "Initializing backup ..."
	echo "Backuppping ..."
	$(rsync -u -r --exclude='*_venv/' $source_directory $destination_directory)
	echo "Backup successfully done."
}

unmount_Device(){
	echo "Unmounting device '$device_partition_to_mount' from '$destination_directory' ..."
	$(sudo umount $destination_directory)
	echo "Device '$device_partition_to_mount' successfully unmounted from '$destination_directory'."
}


main(){
	check_Directories
	mount_Device
	make_Backup
	unmount_Device
	exit 0
}

main
