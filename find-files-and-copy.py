# Have to edit this to be more generic. Currently only looks for pictures in a specific directory

import os
import shutil
import time
from datetime import datetime

start_time = datetime.now()

rootdir = 'D:\\Documents\\Old Computer Drive'
destdir = 'D:\\Pictures\\Old Pictures'
mapping_file = open('D:\\Desktop\\Find Pictures\\file-map.csv', mode='w+')
file_types = set()

for subdir, dirs, files in os.walk(rootdir):
    for file in files:
        full_path = os.path.join(subdir, file)
        full_path_split = full_path.split(".")
        if len(full_path_split) > 1:
            image_types = ["png", "jpg", "jpeg", "tiff", "tif", "gif", "bmp", "eps", "raw", "cr2", "nef", "orf", "sr2", "webp", "svg", "ai"]
            if full_path_split[1].lower() in image_types:
                name  = "Picture " + str(len(os.listdir(destdir)) + 1) + "." + full_path_split[1]
                shutil.copy2(full_path, os.path.join(destdir, name))
                mapping_file.write(name + "," + full_path + "\n")
                
mapping_file.close()

print("Time elapsed:", datetime.now() - start_time)
