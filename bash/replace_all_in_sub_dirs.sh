#!/bin/bash

# Usage instructions
usage() {
    echo "Usage: $0 -t filetype -o old_value -n new_value"
    echo "Example: $0 -t txt -o 'HELLO:old' -n 'HELLO:new'"
}

# Parsing command line options
while getopts "t:o:n:h" opt; do
  case $opt in
    t) filetype="$OPTARG"
    ;;
    o) old_value="$OPTARG"
    ;;
    n) new_value="$OPTARG"
    ;;
    h) usage
       exit 0
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
        usage
        exit 1
    ;;
  esac
done

# Check if necessary arguments are provided
if [ -z "$filetype" ] || [ -z "$old_value" ] || [ -z "$new_value" ]; then
    echo "Missing required arguments"
    usage
    exit 1
fi

# Recursive search and replace
find . -type f -name "*.$filetype" -exec bash -c 'grep -q "$1" "$0" && sed -i "s/$1/$2/g" "$0" && echo "Updated $0"' {} "$old_value" "$new_value" \;

