#!/bin/bash

name=$1
count=$2

if [ -z "$name" ] || [ -z "$count" ]
then
    echo "Error:you forgot to provide input "
    echo "usage: ./level4.sh [name] [count]"
    exit 1
fi

if [ "$count" -gt 0 ]
then
    for (( i=1; i<=count; i++))
    do
       echo "execution of loop $i : $name"
    done
    exit 0
else
    echo "Error: count must be greater than  0"
    exit 2
fi
