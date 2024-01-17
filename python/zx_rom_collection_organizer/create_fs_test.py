import csv
import os
import shutil

file_path = 'dir_struct.csv'
shutil.rmtree('games')
os.mkdir('games')

with open(file_path, 'r') as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)
        game_dir = row[0]
        full_dir = 'games/' + game_dir
        os.mkdir(full_dir)
        blank_file_path = full_dir + '/' + row[-1]
        with open(blank_file_path, 'w') as blank_file:
            blank_file.write("22")
            print("empty file created: " + blank_file_path)