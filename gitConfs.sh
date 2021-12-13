# Run git commands from script folder, not folder where cmd was called
cd "$(dirname "$0")"
git add -A
# Use all arguments for git commit msg
str="'$*'"
gitCmd="git commit -m ${str}"
# Run gitCmd as shellcode for ${str}
eval "$gitCmd"
# Pull token
value=`cat ~/Documents/notes/git.txt`
# Execute push
cmd="git push https://hakirot:${value}@github.com/hakirot/BackupConfigs.git"
eval "$cmd"
