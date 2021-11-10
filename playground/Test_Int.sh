#!/bin/bash

# Test-integer: Evaluate the value of an integer

echo -n "Please enter an integer -> "
read int

if [[ "$int" =~ ^-?[0-9]+$ ]]; then
	if ((int == 0)); then
		echo "INT is zero."
	else
		if ((int < 0)); then
			echo "INT is negative."
		else
			echo "INT is positive."
		fi
		if (( (int % 2) == 0)); then
			echo "INT is even."
		else
			echo "INT is odd."
		fi
	fi
else
	echo "INT is not an integer." >&2
	exit 1
fi
