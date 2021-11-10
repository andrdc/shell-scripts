#!/bin/bash

# Trap_Demo_2 : Simple signal handling demo

exit_On_Signal_SIGINT(){
	echo "Script interrupted." 2>&1
	exit 0
}

exit_On_Signal_SIGTERM(){
	echo "Script interrupted." 2>&1
	exit 0
}

trap exit_On_Signal_SIGINT SIGINT
trap exit_On_Signal_SIGTERM SIGTERM

for i in {1..5}; do
	echo "Iteration $i of 5"
	sleep 5
done
