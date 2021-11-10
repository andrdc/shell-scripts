#!/bin/bash

# Array_Output - Script that display array's output

animals=("a cat" "a dog" "a fish")

echo "array[*]"
for i in ${animals[*]}; do
	echo -e "\t$i"
done

echo "array[@]"
for i in ${animals[@]}; do
	echo -e "\t$i"
done

echo "\"array[*]\""
for i in "${animals[*]}"; do
	echo -e "\t$i"
done

echo "\"array[@]\""
for i in "${animals[@]}"; do
	echo -e "\t$i"
done
