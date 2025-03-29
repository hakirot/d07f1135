#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

alias ls='ls --color=auto'

export PS1="\[\e[32m\][\[\e[31m\]\u \[\e[36m\]\w\[\e[32m\]]\[\e[32m\] $ \[\e[m\]"

alias la='ls -a'
alias ll='ls -la'
alias l='ls -la'

alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gstat='git status'
alias notes='cd ~/Documents/notes'
alias tasks='vim ~/Documents/notes/task'
alias confs='vim -p ~/.bash_profile ~/.bashrc ~/.tmux.conf ~/.vimrc'
alias commands='vim ~/Documents/notes/linux/commands'
alias backupConfs='~/Git/BackupConfigs/getConfs.py'
alias startshare='mkdir /tmp/networkshare; chmod 777 /tmp/networkshare; ~/.local/bin/remount.sh'
alias rmshare='rm -rf /tmp/networkshare/*'

#PATH=$PATH:$HOME/Git/Treek/:$HOME/.local/bin/

alias rsync="rsync -r --progress"

