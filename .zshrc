export PATH=$HOME/.local/bin:$PATH

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
ZSH_THEME="fwalch"

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
#export HISTFILE=$ZDOTDIR/.host_zsh
export HISTFILE=$HOME/.host_zsh
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt NO_NOTIFY

# END HISTORY

RED='\e[31m'
RESET='\e[0m'

alias screenkey='screenkey --window -s small --font-color "#c7adbd"'

alias la='ls -A'
alias ll='ls -l'
alias l='ls -1'
alias sl='ls --color=tty'

# nav
alias dls='cd ~/dls'
alias Dow='cd ~/Downloads'
alias D='cd ~/Downloads'
alias dox='cd ~/dox'
alias gits='cd ~/git'
alias lib='cd ~/lib'
alias pix='cd ~/pix'
alias mzk='cd ~/mzk'
alias skps='cd ~/skps'
alias gits='cd ~/git'
alias config='cd ~/.config'
alias site="cd ~/git/site"
alias rusties="cd ~/git/rust-book/projects"
alias suckless="cd ~/git/suckless-hakirot"

alias bconfs='~/git/backup-configs/getConfs.py'
alias startproxy='ssh -D 1337 -N -C node'
#alias startshare='mkdir /tmp/networkshare; chmod 777 /tmp/networkshare; ~/.local/bin/remount.sh'
#alias rmshare='rm -rf /tmp/networkshare/*'
alias pingg="ping 8.8.8.8"
alias xc="xcolor"
alias passport='sudo mount /dev/sdc1 /mnt/passport'

function pshd {
  if (( $# > 0 )); then
    args=("$@")
    re='^[0-9]+$'
    if [ "$1" = "-l" ] || [ "$1" = "-q" ]; then
      counter=0
      while read p; do
        echo "[$counter] $p"
        ((counter++))
      done <$HOME/.config/pshd/dir
    elif [ "$1" = "--" ]; then
      cd $(head -n 1 $HOME/.config/pshd/dir)
    elif [ "$1" = "-e" ]; then
      nvim $HOME/.config/pshd/dir
    elif [[ $1 =~ $re ]] ; then
      counter=0
      while read dir; do
        if [[ counter -eq $1 ]] ; then
          cd "$dir"
        fi
        ((counter++))
      done <$HOME/.config/pshd/dir
    elif [[ $1 =~ "-p" ]] ; then
      echo $PWD >> $HOME/.config/pshd/dir
      awk '!seen[$0]++' $HOME/.config/pshd/dir > $HOME/.config/pshd/temp
      mv $HOME/.config/pshd/temp $HOME/.config/pshd/dir
      head -n 19 $HOME/.config/pshd/dir > $HOME/.config/pshd/temp
      mv $HOME/.config/pshd/temp $HOME/.config/pshd/dir
    else
      echo "no-op"
    fi
  else
    counter=0
    while read p; do
      echo "[$counter] $p"
      ((counter++))
    done <$HOME/.config/pshd/dir
  fi
}

function dispatch {
  if (( $# != 1 )); then
    echo "no-op"
  else
    git diff "$1" > $1.diff
    cp "$1" "$1.merge"
  fi

  rm -f "$1.diff"
}

alias screenshot="sleep 5 && mkdir -p $HOME/pix/screenshots && scrot $HOME/pix/screenshots/%m-%d-%Y-%H%M%S.png"
alias clock="while :; do date +%I:%M | figlet -f pepper; sleep 5; sleep 1; done"
alias run="cargo run"
# tmatrix-git
alias matrix='tmatrix -c default -t SARA --no-fade -s 20'
alias cr="cargo run"

# fatfinger
alias dc="cd"

# wider
alias rsync='rsync -r --progress'
alias bat='bat --theme base16-256'

# oneshots
alias x='startx'
alias n="fastfetch"
alias c="colortest"
alias s="grep -riIn --exclude-dir node_modules --exclude-dir target"
alias e="env | sort"
alias g="git status -s"
alias gs="git status"
alias gdh="git diff HEAD"
alias b="bluetoothctl connect AC:80:0A:19:89:A8"
alias bd="bluetoothctl disconnect AC:80:0A:19:89:A8"
#alias t='vim ~/dox/notes2/tasks' # AKA alias tasks
#alias p='$HOME/.config/polybar/bar.sh'
alias m='tmatrix -c default -t SARA --no-fade -s 10'
alias t='tree -I target -I node_modules'
alias p='pshd'

# fast find
function f {
  find . -iname "*$1*"
}

function pw {
  gpg --symmetric --output $HOME/.config/pw.gpg # [enter] then ^D to quit
}

export SUDO_ASKPASS=$HOME/skps/secret.sh
# sudo password storage
function sudo {
  if [[ -f "$HOME/.config/pw.gpg" ]]; then
    command sudo --askpass "$@"
  else
    command sudo "$@"
  fi
}

# faster backlight adjustments
function bl {
  if (( $# > 0 )); then
    output=$(stat -c "%a" /sys/class/backlight/intel_backlight/brightness)
    if [ "$output" = "666" ]; then
      echo $1 > /sys/class/backlight/intel_backlight/brightness
    else
      sudo chmod 666 /sys/class/backlight/intel_backlight/brightness
      echo $1 > /sys/class/backlight/intel_backlight/brightness
    fi
  else
    cat /sys/class/backlight/intel_backlight/actual_brightness
  fi
}

function shweep {
  if [[ -f "$HOME/skps/cleanup.sh" ]]; then
    source $HOME/skps/cleanup.sh
  else
    echo "Cleanup script not detected!"
    sleep 2
  fi
  shutdown now
}

alias weather='curl wttr.in'

# old volume controls when knob isn't available
#alias v="pactl set-sink-volume @DEFAULT_SINK@ +5%"
#alias vd="pactl set-sink-volume @DEFAULT_SINK@ -5%"

alias v="nvim"
alias vi="/usr/bin/vim"
alias vim="/usr/bin/nvim"
alias vimall="/usr/bin/nvim -p ./*"

# nav to git project root
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gl='git log --all --decorate --graph --oneline'
alias gp='git push'
alias gdhh='git diff HEAD~1..HEAD'
alias gdmh='git diff main..HEAD'

# Screens
#xrandr --output eDP-1 --primary --mode 1920x1080 --output HDMI-1 --mode 2560x1440 --right-of DP-1

function saraexit {
  cat $HOME/.cache/sara/saraexit
  rm -f $HOME/.cache/sara/saraexit
}

# Lastly, launch tmux/SARA
if [[ ! -z $(pgrep dwm) ]]; then
  # if tmux run sara
  if { [ "$TERM" = "tmux-256color" ] && [ ! -z ${TMUX+x} ] ; } then
  # Optional
    $HOME/git/title-sara/sara -r -F
  # if no tmux please start tmux
  else
    tmux
  fi
else
  if [ "$TERM" = "linux" ] ; then
    wal --theme custom-sara_white
    $HOME/git/title-sara/sara -r -F
  elif [ "$TERM" = "tmux-256color" ] ; then
    $HOME/git/title-sara/sara -r -F
  fi
fi
