git add -A
gitCmd="git commit -m \"$2\""
#git commit -m "Updated."
eval "$gitCmd"
value=`cat ~/Documents/notes/git.txt`
echo ${value}
cmd="git push https://hakirot:${value}@github.com/hakirot/BackupConfigs.git"
eval "$cmd"
