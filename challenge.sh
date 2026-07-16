#!/bin/bash

echo "This is a script for loop; using bash shell"

echo "Enter your name:"
read name

echo "Enter how many times to display your name:"
read count

if [ "$count" -gt 0 ]
then
    for (( i=1; i<=count; i++))
    do
       echo "$name"
    done
else
    echo "Error,Invalid number!"
fi
