#!/bin/bash

# Function to display help message
show_help() {
    echo "Usage: $(basename "$0") [-t file_extension] [-h]"
    echo
    echo "It iterates through the current directory, extracts the audio from video files as MP3 in stereo, and then deletes the original video files."
    echo
    echo "Options:"
    echo "  -t  Specify the file type extension (default is 'mp4'). Example: -t avi"
    echo "  -h  Display this help and exit"
    echo
    echo "Note: 'ffmpeg' must be installed and accessible in your PATH for this script to work."
}

# Default file extension
ext="mp4"

# Parse command-line options
while getopts ":ht:" opt; do
  case $opt in
    h)
      show_help
      exit 0
      ;;
    t)
      ext="${OPTARG}"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Iterate over files with the specified extension
for video in *.$ext; do
  # Check if file exists
  if [[ -f "$video" ]]; then
    # Extract file name without extension
    filename=$(basename "$video" ".$ext")
    
    # Extract audio as MP3 and stereo
    ffmpeg -i "$video" -q:a 0 -map a -ac 2 "${filename}.mp3"

    # Check if ffmpeg was successful
    if [ $? -eq 0 ]; then
      # Delete the original video file
      rm "$video"
    else
      echo "Failed to extract audio from $video"
    fi
  else
    echo "No files found with extension .$ext"
  fi
done
