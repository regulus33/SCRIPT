#!/bin/bash

# Function to display the help message
show_help() {
    echo "Usage: $0 -i <input_mp3> -c <cover_image> -o <output_mp3>"
    echo "  -i    Input MP3 file"
    echo "  -c    Cover image file (JPEG)"
    echo "  -o    Output MP3 file with album art"
    echo "  -h    Display this help message and exit"
}

# Parse command-line options
while getopts ":hi:c:o:" opt; do
    case ${opt} in
        h )
            show_help
            exit 0
            ;;
        i )
            input_mp3=$OPTARG
            ;;
        c )
            cover_image=$OPTARG
            ;;
        o )
            output_mp3=$OPTARG
            ;;
        \? )
            echo "Invalid Option: -$OPTARG" 1>&2
            show_help
            exit 1
            ;;
        : )
            echo "Invalid Option: -$OPTARG requires an argument" 1>&2
            show_help
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

# Check if all required arguments are provided
if [ -z "${input_mp3}" ] || [ -z "${cover_image}" ] || [ -z "${output_mp3}" ]; then
    echo "Error: Missing required arguments"
    show_help
    exit 1
fi

# Add album art to the MP3
ffmpeg -i "${input_mp3}" -i "${cover_image}" -map 0:0 -map 1:0 -c copy -id3v2_version 3 \
-metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" "${output_mp3}"
