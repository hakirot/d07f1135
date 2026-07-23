#!/usr/bin/env python3
import os
import stat
import time

names = []
written = []
homeDir = '/home/roe/'
backupsDir = '/home/roe/git/d07f1135/'

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
        print("\033[0;34mCopied " + entry + " to " + backupsDir + "\033[m")
    push = input("\033[0;35mCommit and Push? [y/N]\033[m\n")
    if push == 'Y' or push == 'y':

        commitMsg = input('\033[0;35mEnter Commit Msg:\033[0;33m ')
        print('\033[0;35m')
        print('pushing...\033[0;34m')

        # https://stackoverflow.com/questions/29106339/when-attempting-run-a-python-script-from-within-another-python-script-i-get-pe
        gitScript = backupsDir + "gitConfs.sh"
        os.system('{} {} '.format('/bin/sh', gitScript) + commitMsg)
        print('\033[m')
#       print('\033[0;35mDone.\033[m')
    else:
        print('\033[0;35mExited.\033[m')
else:
    print('\033[0;35mNothing to do.\033[m')
