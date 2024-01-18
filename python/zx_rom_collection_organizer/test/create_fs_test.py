import csv
import os
import shutil

GAME_LOCATION = 'test/games/'
file_path = 'test/dir_struct.csv'
if os.path.exists(GAME_LOCATION):
    shutil.rmtree(GAME_LOCATION)
else:
    os.makedirs(GAME_LOCATION)

with open(file_path, 'r') as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)
        game_dir = row[0]
        full_dir = GAME_LOCATION + game_dir
        os.mkdir(full_dir)
        blank_file_path = full_dir + '/' + row[-1]
        with open(blank_file_path, 'w') as blank_file:
            blank_file.write("22")
            print("empty file created: " + blank_file_path)