#!/bin/bash

items=()

for item in $(ls); do
    items+=("$item")
done

for item in "${items[@]}"; do
    if [ -d "$item" ]; then
        echo "|$item"
        
        for sub_item in "$item"/*; do
            if [ -e "$sub_item" ]; then
                filename=$(echo "$sub_item" | cut -d '/' -f 2-)
                echo "|    |$filename" 
            fi
        done
    else
        echo "|$item"
    fi
done

exit 0
