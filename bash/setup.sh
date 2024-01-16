#!/bin/zsh
# WARNING! ONLY RUN THIS FROM THE BASH SCRIPT DIRECTORY!
# Make all .sh files in the current directory executable
chmod +x *.sh

# Get the full path of the current directory
DIR="$(pwd)"

# Check if the directory is already in the PATH
if ! grep -q "$DIR" ~/.zshrc; then
    # Add the directory to the PATH
    echo "export PATH=\"$DIR:\$PATH\"" >> ~/.zshrc
    echo "Directory $DIR added to PATH in ~/.zshrc"

    # Apply the changes
    source ~/.zshrc
else
    echo "Directory $DIR is already in PATH."
fi
