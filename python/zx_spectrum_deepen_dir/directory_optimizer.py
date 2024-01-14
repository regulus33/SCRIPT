import os
import shutil
import subprocess

def merge_directories_if_needed(directory):
    """Merges directories using shell command if they contain no files and only one subdirectory."""
    for root, dirs, files in os.walk(directory, topdown=False):
        if not files and len(dirs) == 1:
            single_subdir = os.path.join(root, dirs[0])
            parent_dir = os.path.dirname(root)
            merged_dir_name = f"{os.path.basename(root)}-{dirs[0]}"
            merged_dir = os.path.join(parent_dir, merged_dir_name)

            # Using shell command to move/rename
            try:
                subprocess.run(["mv", single_subdir, merged_dir], check=True)
                os.rmdir(root)
            except subprocess.CalledProcessError as e:
                print(f"Error during merging: {e}")