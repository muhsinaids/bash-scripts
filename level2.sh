#!/bin/bash

echo "do yo want me to code right now? (yes/no)"
read choice

if [ "$choice" = "yes" ]
then
    echo "Lets go! open a code editor"
else
    echo "stay focused , do coding"
fi

