#!/bin/bash

file="./content/main.md"

inotifywait -q -m -e close_write $file |
while read -r filename event; do
    ./mk.sh
done
