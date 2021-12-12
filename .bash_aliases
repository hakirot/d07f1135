# Navigation
alias omgwin='cd /mnt/c/users/omgwin/desktop/'
alias coursework='cd /mnt/c/users/omgwin/desktop/coursework'
alias tlpi='cd /mnt/c/users/omgwin/desktop/coursework/TheLinuxProgrammingInterface/'
alias notes='cd ~/Documents/notes'

alias tmux='tmux -2'
alias tmuxxx='tmux kill-session -t 0'

alias c='clear'

alias python='python3.9'

# alternate vim binary for access to windows clipboard, related cmd in .bashrc
alias vim='vim.gtk3'

alias out='./a.out'
alias rmout='rm a.out'

alias backupConfigs='~/BackupConfigs/importConf.py'

function apt-updater {
    sudo apt-get update &&
    sudo apt-get dist-upgrade -Vy &&
    sudo apt-get autoremove -y &&
    sudo apt-get autoclean &&
    sudo apt-get clean
}

function gitsend {
    value=`cat ~/Documents/notes/git.txt`
    echo ${value}
    cmd="git push https://hakirot:${value}@github.com/hakirot/site.git"
    eval "$cmd"
}

