#!/bin/bash

# Positional_Parameters_2 - Script to display all arguments

count=1

while [[ $# -gt 0 ]]; do
	echo "Argument $count = $1"
	count=$((count + 1))
	shift
done
