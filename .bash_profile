#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

alias ls='ls --color=auto'

export PS1="\[\e[32m\][\[\e[31m\]\u \[\e[36m\]\w\[\e[32m\]]\[\e[32m\] $ \[\e[m\]"

alias la='ls -a'
alias ll='ls -l'
alias l='ls -la'

alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gstat='git status'

alias notes='cd ~/Documents/notes'

alias backupConfs='~/Git/BackupConfigs/getConfs.py'
