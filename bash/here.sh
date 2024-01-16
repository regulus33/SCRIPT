#!/bin/bash

# Get the full path of the script
SCRIPT_PATH="$(dirname "$(realpath "$0")")"

# Print the full path
echo "warping to: $SCRIPT_PATH"
cd $SCRIPT_PATH
