copy_to_clipboard_linux() {
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

paste_from_clipboard_linux() {
    if [ $# -eq 2 ]; then
        filename="$1.$2"
        xclip -selection clipboard -o > "$filename"
        echo "Clipboard contents saved to $filename."
    else
        echo "Error: Please specify a filename and an extension."
    fi
}

paste_from_clipboard_mac() {
    if [ $# -eq 2 ]; then
        filename="$1.$2"
        pbpaste > "$filename"
        echo "Clipboard contents saved to $filename."
    else
        echo "Error: Please specify a filename and an extension."
    fi
}




