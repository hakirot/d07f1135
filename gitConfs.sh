# Run git commands from script folder, not directory where the cmd was called
cd "$(dirname "$0")"

# Add all changes files staging area
git add -A

# Use all arguments for git commit msg
args="'$*'"
gitCmd="git commit -m ${args}"

# Run gitCmd as shellcode for ${args}
eval "$gitCmd"

# Generate push command
cmd="git push"

eval "$cmd"
