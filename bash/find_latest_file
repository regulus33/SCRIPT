#!/bin/bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DIRS="/home/zachary/Desktop;/home/zachary/Downloads"
# Call your Python script with all passed arguments
output=$(python3 "$SCRIPT_DIR/python/latest_file.py" "$1" "$DIRS")

# Check if the command was successful
if [ $? -eq 0 ]; then
    # Echo the output
    echo "$output"

    # Copy to clipboard
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        echo "$output" | pbcopy
    else
        # Linux (requires xclip or xsel)
        if command -v xclip > /dev/null; then
            echo "$output" | xclip -selection clipboard
        elif command -v xsel > /dev/null; then
            echo "$output" | xsel --clipboard --input
        else
            echo "Clipboard utility not found. Please install xclip or xsel."
        fi
    fi
else
    echo "Python script did not execute successfully."
fi
