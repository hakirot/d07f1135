# Run git commands from script folder, not directory where the cmd was called
cd "$(dirname "$0")"

# Add all changes files staging area
git add -A

# Use all arguments for git commit msg
str="'$*'"
gitCmd="git commit -m ${str}"

# Run gitCmd as shellcode for ${str}
eval "$gitCmd"

# Generate push command
cmd="git push"

eval "$cmd"
