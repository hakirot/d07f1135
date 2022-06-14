# Updates
function apt-updater {
    sudo apt-get update &&
    sudo apt-get dist-upgrade -Vy &&
    sudo apt-get autoremove -y &&
    sudo apt-get autoclean &&
    sudo apt-get clean
}

# Navigation
alias omgwin='cd /mnt/c/users/omgwin/desktop/'
alias coursework='cd /mnt/c/users/omgwin/desktop/coursework'
alias tlpi='cd /mnt/c/users/omgwin/desktop/coursework/TheLinuxProgrammingInterface/'
alias notes='cd ~/Documents/notes'
alias webdev='cd /var/www/html'

# Full-Color Tmux
alias tmux='tmux -2'

# Kill Tmux
alias tmuxxx='tmux kill-session -t 0'

# Go Fast (deprecated, use C^l)
# alias c='clear'

# Python 3.9
alias python='python3.9'

# Alternate vim binary for access to windows clipboard, related cmd in .bashrc
alias vim='vim.gtk3'

# C make shorts
alias out='./a.out'
alias rmout='rm a.out'

# Backup configs
alias backupConfs='~/BackupConfigs/getConfs.py'

# Clean trees (deprecated, use treek)
#alias tree="tree -I node_modules -L 3 --noreport"

# Treek
alias treek='~/Documents/github/Treek/treek.sh'
alias treekedit='vim ~/Documents/github/Treek/treek.sh'

# Access GruvBox Color Config for Hyper terminal
alias gruvConf='cmd.exe /C start C:\\Users\\omgwin\\AppData\\Roaming\\Hyper\\.hyper_plugins\\node_modules\\hyper-gruvbox\\index.js'

# Gitties
alias gstat='git status'
alias gac='git add -A; git commit -m'
alias apply-gitignore='git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached'

function foo {
    repo=`basename $(git rev-parse --show-toplevel)`
    echo $repo
}

function gitsend {
    printf '\033[0;34m'
    value=`cat ~/Documents/notes/git.txt`
    repo=`basename $(git rev-parse --show-toplevel)`
    cmd="git push https://hakirot:${value}@github.com/hakirot/${repo}.git"
    eval "$cmd"
    printf '\033[0m'
}

function makeL {
    make clean
    make
    clear
    ./TheGame
}
