copy_to_clipboard() {
    if [ -f "$1" ]; then
        xclip -selection clipboard < "$1"
        echo "Contents of $1 copied to clipboard."
    else
        echo "Error: File not found."
    fi
}

copy_to_clipboard_mac() {
    if [ -f "$1" ]; then
        cat "$1" | pbcopy
        echo "Contents of $1 copied to clipboard."
    else
        echo "Error: File not found."
    fi
}



