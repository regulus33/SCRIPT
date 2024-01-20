#!/bin/bash

# Function to check if a string is a positive integer
is_positive_integer() {
    [[ $1 =~ ^[0-9]+$ ]]
}

# Function to convert a number to binary
convert_to_binary() {
    echo "obase=2; $1" | bc
}

# Function to convert a number to hexadecimal
convert_to_hex() {
    printf "%X" $1
}

# Function to process a range or a single number
process_numbers() {
    local start=$1
    local end=$2

    for (( i=start; i<=end; i++ )); do
        local binary=$(convert_to_binary $i)
        local hex=$(convert_to_hex $i)
        printf "%-5d : %-8s : %s\n" $i $binary $hex
    done
}

# Main part of the script
if [ $# -eq 0 ]; then
    echo "Usage: $0 <number> or $0 <start>..<end>"
    exit 1
fi

# Check if argument is a range
if [[ $1 =~ ^([0-9]+)\.\.([0-9]+)$ ]]; then
    start=${BASH_REMATCH[1]}
    end=${BASH_REMATCH[2]}
    if ! is_positive_integer "$start" || ! is_positive_integer "$end" || [ $start -gt $end ]; then
        echo "Error: Invalid range. Ensure it's in the format <start>..<end> with start less than or equal to end."
        exit 1
    fi
elif is_positive_integer "$1"; then
    start=1
    end=$1
else
    echo "Error: Argument must be a positive integer or a range in the format <start>..<end>."
    exit 1
fi

process_numbers $start $end
