#!/bin/bash

# Function to display help message
show_help() {
    echo "Usage: $(basename "$0") [-a argument_value] [-h]"
    echo
    echo "Options:"
    echo "  -a  Accepts an argument and prints it out."
    echo "  -h  Display this help and exit"
}

# Placeholder for the argument value
arg_value=""

# Parse command-line options
while getopts ":ha:" opt; do
  case $opt in
    h)
      show_help
      exit 0
      ;;
    a)
      arg_value="${OPTARG}"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Check if an argument was provided
if [ -n "$arg_value" ]; then
    echo "Argument received: $arg_value"
else
    echo "No argument provided."
fi

# Space to play with the argument
# --------------------------------
# You can add your code here to play with the 'arg_value' variable.

