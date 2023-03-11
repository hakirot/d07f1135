#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

alias ls='ls --color=auto'

# old/new (fixed)
#export PS1='\[\e[32m\]\u \[\e[37m\]\W \[\e[39m\]\$ \[\e[m\]'
export PS1="\[\e[32m\][\[\e[31m\]\u \[\e[36m\]\w\[\e[32m\]]\[\e[32m\] $ \[\e[m\]"

#$PATH=$PATH:~/.local/bin

alias la='ls -a'
alias ll='ls -l'
alias l='ls -la'

alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gstat='git status'

alias notes='cd ~/Documents/notes'

