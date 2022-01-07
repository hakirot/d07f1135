# Navigation
alias omgwin='cd /mnt/c/users/omgwin/desktop/'
alias coursework='cd /mnt/c/users/omgwin/desktop/coursework'
alias tlpi='cd /mnt/c/users/omgwin/desktop/coursework/TheLinuxProgrammingInterface/'
alias notes='cd ~/Documents/notes'

# Tmux color option
alias tmux='tmux -2'
# Kill all tmux
alias tmuxxx='tmux kill-session -t 0'

alias c='clear'

alias python='python3.9'

# alternate vim binary for access to windows clipboard, related cmd in .bashrc
alias vim='vim.gtk3'

# C code shorthands
alias out='./a.out'
alias rmout='rm a.out'

# Config backup shellscripts
alias backupConfs='~/BackupConfigs/getConfs.py'

alias gstat='git status'

alias gruvConf='cmd.exe /C start C:\\Users\\omgwin\\AppData\\Roaming\\Hyper\\.hyper_plugins\\node_modules\\hyper-gruvbox\\index.js'

function apt-updater {
    sudo apt-get update &&
    sudo apt-get dist-upgrade -Vy &&
    sudo apt-get autoremove -y &&
    sudo apt-get autoclean &&
    sudo apt-get clean
}

# gitties
alias gac='git add -A; git commit -m'

function gitsend {
    printf '\033[0;34m'
    value=`cat ~/Documents/notes/git.txt`
    cmd="git push https://hakirot:${value}@github.com/hakirot/site.git"
    eval "$cmd"
    printf '\033[0m'
}

function lukassend {
    printf '\033[0;34m'
    value=`cat ~/Documents/notes/git.txt`
    cmd="git push https://hakirot:${value}@github.com/hakirot/LukasAndFriends.git"
    eval "$cmd"
    printf '\033[0m'
}

function indySend {
    printf '\033[0;34m'
    value=`cat ~/Documents/notes/git.txt`
    cmd="git push https://hakirot:${value}@github.com/hakirot/IndyJones.git"
    eval "$cmd"
    printf '\033[0m'
}

function makeL {
    make clean
    make
    clear
    ./TheGame
}

function makeW {
    make clean
    make
}
