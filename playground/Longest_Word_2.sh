#!/bin/bash

# Longest_Word_2 - Find longest string in a file

for i; do
	if [[ -r $i ]]; then
		max_word=
		max_len=0
		for j in $(strings $i); do
			len=$(echo -n $j | wc -c)
			if (( len > max_len )); then
				max_len=$len
				max_word=$j
			fi
		done
		echo "$i: '$max_word' ($max_len characters)"
	fi
done
