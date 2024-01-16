import os
import sys
from ipdb import set_trace as b

file_type = ""
directories = []
arg_length = len(sys.argv)
if arg_length > 1:
    file_type = sys.argv[1]
    directories = sys.argv[2].split(";")
else:
    print("No args passed, directories must be provided i.e /home/zachary/Downloads /home/zachary/Desktop")


def mget_mtime(x):
    return os.path.getmtime(x)


def collect_files(directories, file_type):
    files_of_type = []
    for directory in directories:
        # b()
        files = os.listdir(directory)
        for file in files:
            split_file = file.split(".")
            if not len(split_file) <= 1:
                if file.split(".")[-1] == file_type:
                    # b()
                    files_of_type.append(os.path.join(directory, file))

    files_of_type.sort(key=lambda x: mget_mtime(x))
    return files_of_type[-1]


latest_file = collect_files(directories, file_type)
print(latest_file)
