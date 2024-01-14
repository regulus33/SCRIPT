#!/bin/bash

# Loop through all .m4b files in the current directory
for file in *.m4b; do
    # Skip if no M4B files are found
    if [[ ! -e "$file" ]]; then
        echo "No M4B files found."
        exit 1
    fi

    # Extract the filename without the extension
    base_name=$(basename "$file" .m4b)

    # Convert M4B to MP3 with the same name
    ffmpeg -i "$file" -acodec libmp3lame -ab 128k "${base_name}.mp3"
done

echo "Conversion complete."

