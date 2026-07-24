#!/bin/bash

file_path=""

while [ "$1" != "" ]
do
  case $1 in
       -f )
           file_path="$2"
           shift 2
           ;;
        * )
           echo "Usage: ./line_counter.sh -f <file_path>" >&2
           exit 1
           ;;
  esac
done

if [ -z "$file_path" ]
then
    echo "Error: File '$file_path' not found!" >&2
    echo "you can use: ./line_counter.sh -f <file_path>"
    exit 1
fi

count=0
while IFS= read -r line || [ -n "$line" ]
do
  count=$((count+1))
done < "$file_path"

echo "File '$file_path' has $count line(s)."

