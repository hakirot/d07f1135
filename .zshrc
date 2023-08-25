# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=1000
setopt notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hakirot/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PS1="%F{magenta}%T%f %F{green}%~%f %F{magenta}>%f "

alias ls='ls --color=auto'
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

