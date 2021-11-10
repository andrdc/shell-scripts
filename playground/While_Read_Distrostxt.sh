#!/bin/bash

# While read distros.txt - Read lines from a file

while read distro version release; do
	printf "Distro: %s\tVersion: %s\tReleased: %s\n" \
		$distro \
		$version \
		$release
done < distros.txt
