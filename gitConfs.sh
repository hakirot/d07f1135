# Run git commands from script folder, not folder where cmd was called
cd "$(dirname "$0")"

# Add all changes files staging area
git add -A

# Use all arguments for git commit msg
str="'$*'"
gitCmd="git commit -m ${str}"

# Run gitCmd as shellcode for ${str}
eval "$gitCmd"

# Read token
value=`cat ~/Git/token/token.txt`

# Generate push command
cmd="git push https://hakirot:${value}@github.com/hakirot/BackupConfigs.git"

eval "$cmd"
