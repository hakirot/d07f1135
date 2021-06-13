alias omgwin='cd /mnt/c/users/omgwin/desktop/'
alias coursework='cd /mnt/c/users/omgwin/desktop/coursework'
alias tlpi='cd /mnt/c/users/omgwin/desktop/coursework/TheLinuxProgrammingInterface/'

#alias make= "make | awk '{printf " %-4s %-3s %-24s %-30s\n", $1, $2, $3, $4}'"

alias tmux='tmux -2'

alias c='clear'

alias python='python3.8'

# alternate vim binary for access to windows clipboard, related cmd in .bashrc
alias vim='vim.gtk3'

alias out='./a.out'
alias rmout='rm a.out'

function apt-updater {
    apt-get update &&
    apt-get dist-upgrade -Vy &&
    apt-get autoremove -y &&
    apt-get autoclean &&
    apt-get clean
}

