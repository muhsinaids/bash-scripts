#!/bin/bash

name="Guest"
count=4
file_path=""

while [ "$1" != "" ]
do
  case $1 in
      -n )
          name="$2"
          shift  2
          ;;
      -c )
          count="$2"
          shift 2
          ;;
      -f )
          file_path="$2"
          shift 2
          ;;
      -h )
          echo "Usage: ./level8.sh [-n name] [-f file] [-c count] [-h]"
          echo "Options:"
          echo " -n <name>    Single name to greet"
          echo " -f <file>    Path to file containing list of names"
          echo " -c <count>   Number of times to greet"
          echo " -h           Show this help manual"
          exit 0
          ;;
       * )
          echo "Error: Unknown option '$1'" >&2
          echo "Usage: ./level8.sh [-n name] [-f file] [-c count] [-h]" >&2
          exit 1
          ;;
  esac
done

if [ "$name" != "Guest" ] && [ -n "$file_path" ]
then
    echo "Error: you cannot use both -n and -f flags together!" >&2
    echo "Choose either a single name (-n) OR a file (-f)." >&2
    exit 1
fi

if [ -n "$file_path" ]
then
    if [ ! -f "$file_path" ]
    then
        echo "Error: File '$file_path' does not exist or is not a regular file!" >&2
        exit 1
    fi
fi

log_dir="./logs4"
log_file="$log_dir/batch_history.txt"

if [ -e "$log_dir" ] && [ ! -d "$log_dir" ]
then
    echo "Error: A file named '$log_dir' already exists" >&2
    echo "Please remove the file '$log_dir' and try again" >&2
    exit 1
fi

if [ ! -d "$log_dir" ]
then
    mkdir "$log_dir"
fi

echo "---NEW SCRIPT EXECUTION---" >> "$log_file"

if [ -n "$file_path" ]
then
    while IFS= read -r line_name || [ -n "$line_name" ]
    do
      if [ -z "$line_name" ]
      then
          continue
      fi

      for (( i=1; i<=count; i++ ))
      do
        echo "Loop $i : hello $line_name"
        echo "Loop $i : hello $line_name" >> "$log_file"
      done
    done < "$file_path"

else
    for (( i=1; i<=count; i++ ))
      do
        echo "loop $i : hello $name"
        echo "loop $i : hello $name" >> "$log_file"
      done
fi

echo "Execution completed! for log file : cat ./logs3/batch_history.txt"

if [ "$name" = "Guest" ] && [ "$count" -eq 4 ] && [ -z "$file_path" ]
then
    echo "--------------------------------------------------------"
    echo "        HINT: YOU RAN WITH DEFAULT ARGUMENTS            "
    echo "Single usage: ./level8.sh -n <name> -c <count>"
    echo "Batch usage: ./level8.sh -f <file.txt> -c <count>"
    echo "--------------------------------------------------------"
fi

