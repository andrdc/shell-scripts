#!/bin/bash

# Async_Parent : Asynchronous execution demo (Parent)

echo "Parent: starting..."

echo "Parent: launching child script..."
./Async_Child.sh &
pid=$!
echo "Parent: child (PID = $pid) launched."

echo "Parent: continuing..."
sleep 2

echo "Parent: pausing to wait for child to finish..."
wait $pid

echo "Parent: child is finished. Continuing..."
echo "Parent: parent is done. Exiting."
