git add -A
git commit -m "Updated."
value=`cat ~/Documents/notes/git.txt`
echo ${value}
cmd="git push https://hakirot:${value}@github.com/hakirot/BackupConfigs.git"
eval "$cmd"
