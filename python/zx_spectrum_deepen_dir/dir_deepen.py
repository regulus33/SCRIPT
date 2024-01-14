import os
import shutil
from collections import defaultdict

def find_common_prefixes(directory, delimiter='_'):
    """Finds common prefixes in the file names of the given directory."""
    prefix_dict = defaultdict(list)
    for filename in os.listdir(directory):
        if os.path.isfile(os.path.join(directory, filename)):
            prefix = filename.split(delimiter)[0]
            prefix_dict[prefix].append(filename)
    return {k: v for k, v in prefix_dict.items() if len(v) > 1}

def create_and_move_file(src_dir, dest_dir, filename):
    """Creates directories as needed and moves the file."""
    os.makedirs(dest_dir, exist_ok=True)
    shutil.move(os.path.join(src_dir, filename), os.path.join(dest_dir, filename))

def sort_files_by_prefix(directory, delimiter='_'):
    """Sorts files in the directory into subdirectories based on common prefixes."""
    common_prefixes = find_common_prefixes(directory, delimiter)
    for prefix, files in common_prefixes.items():
        for filename in files:
            new_filename = delimiter.join(filename.split(delimiter)[1:])
            sub_dir = os.path.join(directory, prefix)
            create_and_move_file(directory, sub_dir, filename)
            # Rename the file in its new location
            os.rename(os.path.join(sub_dir, filename), os.path.join(sub_dir, new_filename))

# Example usage
# sort_files_by_prefix("/path/to/your/directory", delimiter="_")
