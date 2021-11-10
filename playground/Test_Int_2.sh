#!/bin/bash

# testInt2 - Determine if an integer is within a specified range of values

MIN_VALUE=1
MAX_VALUE=100

INT=150

if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
	if [[ INT -ge MIN_VALUE && INT -le MAX_VALUE ]]; then
		echo "$INT is within $MIN_VALUE to $MAX_VALUE."
	elif [[ ! (INT -ge MIN_VALUE && INT -le MAX_VALUE) ]]; then
		echo "$INT is outside $MIN_VALUE to $MAX_VALUE."
	fi
else
	echo "INT is not an integer." >&2
	exit 1
fi
