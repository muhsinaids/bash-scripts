#!/bin/bash

log_dir="./logs0"
show_log=0

while [ "$1" != "" ]
do
  case $1 in
     -l )
         show_log=1
         shift
         ;;
      * )
         echo "Usage: ./system_check.sh [-l]" >&2
         exit 1
         ;;
  esac
done

if [ ! -d "$log_dir" ]
then
    echo "Creating directory 'log_dir' now ..."
    mkdir "$log_dir"
else
    echo "Directory 'log_file' already exists"
fi

log_file="$log_dir/status.txt"
echo "Check run at: $(date)" >> "$log_file"
echo "Status: OK"
echo "you can use: ./system_check.sh -l"


if [ "$show_log" -eq 1 ]
then
    echo "---log content---"
    cat "$log_file"
fi
