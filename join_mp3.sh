#!/bin/bash

# Create or clear the file list
echo -n > mylist.txt

# Loop through all .mp3 files in the current directory and add them to the list
for file in *.mp3; do
    # Check if the file exists
    if [[ -f "$file" ]]; then
        echo "file '$file'" >> mylist.txt
    fi
done

# Check if mylist.txt is not empty
if [ ! -s mylist.txt ]; then
    echo "No MP3 files found."
    exit 1
fi

# Join the MP3 files
ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp3

echo "MP3 files have been successfully joined into output.mp3"

