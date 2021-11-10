#!/bin/bash

# Array_Elements - Script to see how array elements behave.

# Array element initialized in an index greater than 0
my_array[100]='Hello'

echo "my_array[100]='Hello'."
echo "Number of array elements: ${#my_array[@]}"
echo "Lenght of the array element: ${#my_array[100]}"

my_array=([1]+='Hello' [3]+='f*cking' [5]+='world')
echo -e "\nmy_array=([1]='Hello' [3]='f*cking' [5]='world'):"
echo "my_array[*]:"
for i in "${my_array[*]}"; do
	echo -e "\t$i"
done
echo "!my_array[*]:"
for i in "${!my_array[*]}"; do
	echo -e "\t$i"
done
echo "my_array[@]:"
for i in "${my_array[@]}"; do
	echo -e "\t$i"
done
echo "!my_array[@]:"
for i in "${!my_array[@]}"; do
	echo -e "\t$i"
done

my_array+=(this are more words added after the array was initialized)
echo -e "\n${my_array[@]}"
