import os
import re
import shutil

def get_files_and_dirs(base_path, dirs):
    collection = []
    for entry in os.listdir(base_path):
        full_path = os.path.join(base_path, entry)
        if os.path.isdir(full_path) and dirs == True:
            collection.append(full_path)
        if os.path.isfile(full_path) and dirs == False:
            collection.append(full_path)
    return collection


def merge_directories(source_dir, target_dir):
    if os.path.exists(target_dir):
        for item in os.listdir(source_dir):
            source_item = os.path.join(source_dir, item)
            target_item = os.path.join(target_dir, item)

            if os.path.isfile(source_item):
                # If the file already exists in the target directory, you can choose to rename, overwrite, or skip
                if os.path.exists(target_item):
                    # Example: Rename the source file
                    base, extension = os.path.splitext(item)
                    new_target_item = os.path.join(target_dir, f"{base}_duplicate{extension}")
                    shutil.move(source_item, new_target_item)
                else:
                    shutil.move(source_item, target_item)
            elif os.path.isdir(source_item):
                # Recursive call for directories
                merge_directories(source_item, target_item)

        # Remove source directory if empty
        if not os.listdir(source_dir):
            os.rmdir(source_dir)
    else:
        # If the target directory doesn't exist, just rename
        os.rename(source_dir, target_dir)


def remove_after_parens(string):
    # replace everything following parens with ""
    return re.sub("\(.*", "", string).strip()


def rename_dirs(base_path):
    dirs = get_files_and_dirs(base_path, dirs=True)
    old_to_new_dirs = {}
    for dir in dirs:
        n = dir.split("/")[-1]
        new_name = remove_after_parens(n)
        new_dirname = os.path.join(base_path, new_name)
        old_to_new_dirs[dir] = new_dirname

    for old_new in old_to_new_dirs.items():
        merge_directories(*old_new)
    for dir in dirs:
        letter_dir = dir.split("/")[-1][0]
        if letter_dir.isalpha():
            new_dirname = os.path.join(base_path, letter_dir)
            merge_directories(dir, new_dirname)
        else:



rename_dirs('/home/zachary/Desktop/SCRIPT/python/zx_rom_collection_organizer/test/games')
