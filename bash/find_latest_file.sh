#!/bin/bash

# Directories to search
SEARCH_DIRS=("$HOME/Desktop" "$HOME/Downloads")

# Function to display help message
display_help() {
    echo "Usage: $0 <file_extension> [options]"
    echo
    echo "This script finds the most recently updated file with the specified file extension"
    echo "in the Desktop and Downloads folders and copies the path to the clipboard."
    echo
    echo "Options:"
    echo "  -h, --help    Display this help message and exit."
    echo
    echo "Example:"
    echo "  $0 pdf        Finds the most recent PDF file and copies its path."
}

# Check for help option
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    display_help
    exit 0
fi

# File extension to search for, provided as the first argument
FILE_EXTENSION="$1"

# Check if file extension was provided
if [ -z "$FILE_EXTENSION" ]; then
    echo "Error: No file extension provided."
    display_help
    exit 1
fi

# Finding the most recently updated file and copying to clipboard
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    find "${SEARCH_DIRS[@]}" -type f -name "*.$FILE_EXTENSION" -exec ls -lt {} + | head -n 1 | awk '{print $NF}' | xclip -selection clipboard
elif [[ "$OSTYPE" == "darwin"* ]]; then
    find "${SEARCH_DIRS[@]}" -type f -name "*.$FILE_EXTENSION" -exec ls -lt {} + | head -n 1 | awk '{print $NF}' | pbcopy
else
    echo "Unsupported operating system."
    exit 1
fi

echo "Path copied to clipboard."
