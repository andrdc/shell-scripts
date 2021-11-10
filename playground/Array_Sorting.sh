#!/bin/bash

# Array_Sorting - Script to sort an array

my_array=(d u n d e r)
echo "Original array: ${my_array[@]}"
sorted_array=($(for i in ${my_array[@]}; do echo $i; done | sort))
echo "Sorted array: ${sorted_array[@]}"

# Deleting one element of each array
unset 'my_array[2]'
unset 'sorted_array[2]'
echo "3rd element deleted: ${my_array[@]}"
echo "3rd element deleted: ${sorted_array[@]}"

# Deleting the both whole array
unset my_array
unset sorted_array
echo "Whole array deleted: ${my_array[@]}"
echo "Whole array deleted: ${sorted_array[@]}"
