#!/usr/bin/env python3
import os
import stat
import time

names = []
written = []
check = 0
backups = os.scandir('.')
for entry in backups:
    names.append(entry.name)
#print(names)

path = '../'
obj = os.scandir(path)
for entry in obj:
    if (entry.is_file() and entry.name in names):

        fileStat = os.stat('../' + entry.name)
        modTime = time.ctime(fileStat [ stat.ST_MTIME ])

        fileStat = os.stat('./' + entry.name)
        backupTime = time.ctime(fileStat [ stat.ST_MTIME ])

        if(modTime != backupTime):
            rmCmd = "rm ~/BackupConfigs/" + entry.name
            cpCmd = "cp -p ../" + entry.name + " ~/BackupConfigs"
            os.system(rmCmd)
            os.system(cpCmd)
            written.append(entry.name)
if len(written) > 0:
    for entry in written:
        print("\033[30mCopied " + entry + " to ~/BackupConfigs\033[m")
    push = input("Push to Github? Y/y\n")
    if push == 'Y' or push == 'y':
        print('pushing')
        cwd = os.path.join(os.getcwd(), "gitConfs.sh")
        os.system('{} {}'.format('/bin/sh', cwd))
obj.close()
