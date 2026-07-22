#!/bin/bash

name="Guest"
count=4

while [ "$1" != "" ]; do
    case $1 in
        -n )
               name="$2"
               shift 2
               ;;
        -c )
               count="$2"
               shift 2
               ;;
        -h )
               echo "Usage: ./level7.sh [-n name] [-c count] [-h]"
               exit 0
               ;;
        * )
               echo "Error: Unknown option '$1'" >&2
               echo "Usage: ./level7.sh [-n name] [-c count] [-h]" >&2
               exit 1
               ;;
    esac
done

log_dir="./logs3"
log_file="$log_dir/usage_loop.txt"

if [ -e "$log_dir" ] && [ ! -d "$log_dir" ]
then
    echo "Error: file named '$log_dir' already exists" >&2
    echo "Please remove the file '$log_dir' and try again" >&2
    exit 1
fi

if [ ! -d "$log_dir" ];
then
    mkdir "$log_dir"
fi

echo "---NEW SCRIPTS EXECUTION---" >> "$log_file"

for (( i=1; i<=count; i++ ))
do
  echo "loop $i : hello $name"
  echo "loop $i : hello $name" >> "$log_file"
done

echo "Execution completed! for referring the loop file use: cat ./logs3/usage_loop.txt"

if [ "$name" = "Guest" ] && [ "$count" -eq 4 ]
then
    echo "----------------------------------------------------"
    echo "    HINT : YOU RAN WITH DEFAULT ARGUMENTS!      "
    echo "custom usage: ./level7.sh -n <your-name> -c <count>"
    echo "----------------------------------------------------"
fi

