# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

function hakirotsend () {
  echo "sending $1 to HAKIROT"
  sleep 1
  rsync -r --progress $1 hakirot@192.168.0.103:/home/hakirot/Downloads
}

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconf="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#source /home/hakirot/.local/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#bindkey -v
bindkey "^R" history-incremental-search-backward

# History
export HISTFILE=$ZDOTDIR/.host_zsh
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

# END HISTORY

# Please add these doodads to PATH
alias newlook=~/.local/bin/newlook
alias dynamake=~/.local/bin/dynamake
alias gitty=~/.local/bin/gitty
alias colortest=~/.local/bin/colortest
alias sara="cd ~/git/title-sara/"
alias passport='sudo mount /dev/sda1 /mnt/passport'
# TODO add skps to path

alias matrix='tmatrix -c default -t SARA --no-fade -s 20'

alias la='ls -A'
alias ll='ls -lA'
alias l='ls -1A'
alias sl='ls -A'

# nav
alias dls='cd ~/dls'
alias Dow='cd ~/Downloads'
alias D='cd ~/Downloads'
alias dox='cd ~/Downloads'
alias gits='cd ~/git'
alias lib='cd ~/lib'
alias pix='cd ~/pix'
alias skps='cd ~/skps'
alias config='cd ~/.config'
alias site="cd ~/git/site"
alias suckless="cd ~/git/suckless-hakirot"

alias notes='cd ~/dox/notes2'

alias backupConfs='~/git/backup-configs/getConfs.py'
alias startproxy='ssh -D 1337 -N -C node'
#alias startshare='mkdir /tmp/networkshare; chmod 777 /tmp/networkshare; ~/.local/bin/remount.sh'
#alias rmshare='rm -rf /tmp/networkshare/*'
alias walls="cd /home/hakirot/pix/wall/"
function psh { echo $PWD > $HOME/.config/psh/dir; }
function psha { cd $(cat $HOME/.config/psh/dir); }
function bl { 
  if (( $# > 0 )); then
    bash -c "echo $1 > /sys/class/backlight/intel_backlight/brightness"
  else
    cat /sys/class/backlight/intel_backlight/actual_brightness
  fi
}
alias screenshot="mkdir -p $HOME/pix/screenshots && scrot $HOME/pix/screenshots/%m-%d-%Y-%H%M%S.png"
alias clock="while :; do date +%I:%M | figlet -f pepper; sleep 5; sleep 1; done"
alias run="cargo run"

# fatfinger
alias dc="cd"

# wider
alias rsync='rsync -r --progress'
alias bat='bat --theme base16-256'

# oneshots
alias x='startx'
alias n="neofetch"
alias c="colortest"
alias s="grep -riIn --exclude-dir node_modules"
alias e="env | sort"
alias b="bluetoothctl connect AC:80:0A:19:89:A8"
alias t="tree"
#alias t='vim ~/dox/notes2/tasks' # AKA alias tasks
#alias p='$HOME/.config/polybar/bar.sh'
alias m='tmatrix -c default -t SARA --no-fade -s 20'

# fast find
function f {
  find . -iname "*$1*"
}

# old volume controls when knob isn't available
#alias v="pactl set-sink-volume @DEFAULT_SINK@ +5%"
#alias vd="pactl set-sink-volume @DEFAULT_SINK@ -5%"

alias v="nvim"
alias vi="/usr/bin/vim"
alias vim="/usr/bin/nvim"
alias vimall="/usr/bin/nvim -p ./*"

alias zap="kill -9 "

# gits
alias g='git status -s'
alias gs='git status'
alias gc='git commit -m'
alias ga='git add'
alias gaa='git add --all'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gl='git log --all --decorate --graph --oneline'
alias gp='git push'
alias gdh='git diff HEAD'
alias gdhh='git diff HEAD~1..HEAD'
alias gdmh='git diff main..HEAD'

# if running DWM
if [[ ! -z $(pgrep dwm) ]]; then
  # if tmux run sara
  if { [ "$TERM" = "tmux-256color" ] && [ ! -z ${TMUX+x} ] ; } then
  # Optional
    $HOME/git/title-sara/sara
  # if no tmux please start tmux
  else
    tmux
  fi
fi

# Screens
#xrandr --output eDP-1 --primary --mode 1920x1080 --output HDMI-1 --mode 2560x1440 --right-of DP-1

# if file ~/.saraexit exits
#   Read file
#   cd to direcory
#   Delete file
