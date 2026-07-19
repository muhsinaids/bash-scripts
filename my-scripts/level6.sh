#!/bin/bash

name=${1:-Guest}
count=${2:-2}

if [ -z "$1" ] || [ -z "$2" ]
then
    echo "Tip :you can customize the usage; ./level6.sh [name] [count]"
fi

log_dir="./logs2"
log_file="$log_dir/loop_history.txt"

if [ -e "$log_dir" ] && [ -d "$log_dir" ]
then
    echo "Error : A file named '$log_dir' already exists" >&2
    echo "Please remove the file '$log_dir' and try again" >&2
    exit 1
fi

if [ -d "$log_dir" ]
then
    echo "Directory '$log_dir' already exists"
else
    echo "Directory '$log_dir'not found, creating it now..."
    mkdir "$log_dir"
fi

if ! [[ "$count" =~ ^[0-9]+$ ]]
then
    echo "Error: count must be positive number, got '$count' " >&2
    exit 1
fi

echo "___NEW SCRIPT EXECUTION___" >> "$log_file"

for (( i=1; i<=count; i++ ))
do
  echo "Loop $i : hello $name" >> "$log_file"
done

echo "Execution completed! for reading use: cat $log_file"
exit 0
