#!/bin/bash

name=$1
count=$2

if [ -z "$name" ] || [ -z "$count" ]
then
    echo "USAGE: ./level5.sh [name] [count]"
    exit 1
fi

log_dir="logs"
log_file="$log_dir/user_history.txt"

if [ -d "$log_dir" ]
then
    echo "Directory '$log_dir' already exists"
else
    echo "Directory '$log_dir'not found,creating it now"
    mkdir "$log_dir"
fi

echo "---NEW SCRIPT EXECUTION---" >> "$log_file"

for (( i=1; i<=count; i++ ))
do
  echo "Loop $i : hello $name" >> "$log_file"
done

echo "Execution completed! for reading use :cat logs/user_history.txt"
exit 0
