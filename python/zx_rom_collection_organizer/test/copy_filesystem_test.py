import os
import csv
def save_filesystem_structure(base_path, dirs_file):
    pairs = []
    for entry in os.listdir(base_path):
        pair = []
        full_path = os.path.join(base_path, entry)
        if os.path.isdir(full_path):
            pair.append(entry)
            for entry2 in os.listdir(full_path):
                if os.path.isfile(os.path.join(full_path, entry2)):
                    pair.append(entry2)
            pairs.append(pair)
    with open(dirs_file, mode='w', newline='') as file:
        writer = csv.writer(file, delimiter=',', quotechar='"')
        for row in pairs: writer.writerow(row)


# Replace '/path/to/your/roms' with the actual path to your ROMs
# Replace 'filesystem_structure.txt' with your desired output file name
save_filesystem_structure('/media/zachary/3F0B-AD70/zxspectrum/snapshots/quicksaves/games', 'dir_struct.csv')
