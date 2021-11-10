#!/bin/bash

# Process_Sustitution - Demo of process substitution

while read attr links owner group size data time filename; do
	cat <<- EOF
		Filename:	$filename
		Size:		$size
		Owner:		$owner
		Group:		$group
		Modified:	$data $time
		Links:		$links
		Attributes:	$attr
	EOF
done < <(ls -l | tail -n +2)
