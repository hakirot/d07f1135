git add -A
str="'$*'"
gitCmd="git commit -m ${str}"
eval "$gitCmd"
value=`cat ~/Documents/notes/git.txt`
echo ${value}
cmd="git push https://hakirot:${value}@github.com/hakirot/BackupConfigs.git"
eval "$cmd"
