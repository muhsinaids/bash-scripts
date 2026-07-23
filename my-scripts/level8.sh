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

if [ -e "$log_dir" ] && [ -d "$log_dir" ]
then
    echo "Error: A file named '$log_dir' already exists" >&2
    echo "Please remove the file '$log_dir' and try again" >&2
    exit 1
fi

if [ !-d "$log_dir ]
then
    mkdir "$log_dir"
fi
