import os
import sys

# Function to get the modification time of a file
def mget_mtime(x):
    return os.path.getmtime(x)

# Function to collect files
def collect_files(directories, file_type):
    files_of_type = []
    for directory in directories:
        try:
            items = os.listdir(directory)
        except OSError:
            print(f"Error accessing directory: {directory}")
            continue

        for item in items:
            full_path = os.path.join(directory, item)
            if os.path.isfile(full_path):  # Check if it's a file
                if file_type:
                    if item.endswith(f".{file_type}"):
                        files_of_type.append(full_path)
                else:
                    files_of_type.append(full_path)

    files_of_type.sort(key=lambda x: mget_mtime(x))
    return files_of_type[-1] if files_of_type else None

# Main logic
file_type = ""
directories = []

arg_length = len(sys.argv)
if arg_length > 1:
    file_type = sys.argv[1]
    directories = sys.argv[2].split(";") if arg_length > 2 else []
else:
    print("No file type specified. Looking for the latest file of any type.")

# Default directories if none provided
if not directories:
    directories = ["/home/zachary/Downloads", "/home/zachary/Desktop"]

latest_file = collect_files(directories, file_type)
if latest_file:
    print(latest_file)
else:
    print("No files found.")
