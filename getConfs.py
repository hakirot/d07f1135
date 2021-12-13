#!/usr/bin/env python3
import os
import stat
import time

names = []
written = []
homeDir = '/home/hakirot/'
backupsDir = '/home/hakirot/BackupConfigs/'

backups = os.scandir(backupsDir)
for entry in backups:
    names.append(entry.name)

obj = os.scandir(homeDir)
for entry in obj:
    if (entry.is_file() and entry.name in names):

        fileStat = os.stat(homeDir + entry.name)
        modTime = time.ctime(fileStat [ stat.ST_MTIME ])

        fileStat = os.stat(backupsDir + entry.name)
        backupTime = time.ctime(fileStat [ stat.ST_MTIME ])

        if(modTime != backupTime):
            rmCmd = "rm " + backupsDir + entry.name
            cpCmd = "cp -p " + homeDir + entry.name + " " + backupsDir
            os.system(rmCmd)
            os.system(cpCmd)
            written.append(entry.name)
obj.close()

if len(written) > 0:
    for entry in written:
        print("\033[32mCopied " + entry + " to ~/BackupConfigs\033[m")
    push = input("\033[35mPush to Github? [Y/y]\033[m\n")
    if push == 'Y' or push == 'y':
        print('\033[34m')

        print('pushing...')
        commitMsg = "Iterations"
        #commitMsg = input('Enter Commit Msg: ')

        # https://stackoverflow.com/questions/29106339/when-attempting-run-a-python-script-from-within-another-python-script-i-get-pe
        gitScript = backupsDir + "gitConfs.sh"
        os.system('{} {} '.format('/bin/sh', gitScript) + commitMsg)
        print('\033[m')

        print('\033[32mDone!\033[m')
else:
    print('\033[35mFiles are up to date. None Copied.\033[m')
