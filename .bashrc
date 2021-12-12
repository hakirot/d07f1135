# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# The following block is surrounded by two delimiters.
# These delimiters must not be modified. Thanks.
# START KALI CONFIG VARIABLES
#PROMPT_ALTERNATIVE=twoline
#NEWLINE_BEFORE_PROMPT=yes
# STOP KALI CONFIG VARIABLES

if [ "$color_prompt" = yes ]; then
    # override default virtualenv indicator in prompt
    VIRTUAL_ENV_DISABLE_PROMPT=1

    prompt_color='\[\033[;32m\]'
    info_color='\[\033[1;34m\]'
    prompt_symbol=㉿
    if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
        prompt_color='\[\033[;94m\]'
        info_color='\[\033[1;31m\]'
        prompt_symbol=💀
    fi
    case "$PROMPT_ALTERNATIVE" in
        twoline)
            PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}('$info_color'\u${prompt_symbol}\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] ';;
        oneline)
            PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}'$info_color'\u@\h\[\033[00m\]:'$prompt_color'\[\033[01m\]\w\[\033[00m\]\$ ';;
        backtrack)
            PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
    esac
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

#[ "$NEWLINE_BEFORE_PROMPT" = yes ] && PROMPT_COMMAND="PROMPT_COMMAND=echo"

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#---------------------------------- SANSANTAS CUSTOMS ---------------------------------
# clean custom bash prompt
#export PS1="\e[35;40m\] \W\e[m\] $ "
export PS1="\e[0;33m \W\e[m \e[0;30m$\e[m "

# custom access to windows clipboard through XLaunch
export DISPLAY=localhost:0.0

# Start the initializer script
~/.init

# Groovy Colors!
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# This is a chunky boi, slows terminal use; bad! Comment out when NOT USING NODE!!
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# dircolors
LS_COLORS='EXEC=1;34:di=1;34:*.bak=38;5;246:*.cache=38;5;246:*.dist=38;5;246:*.lock=38;5;246:*.log=38;5;246:*.old=38;5;246:*.orig=38;5;246:*.temp=38;5;246:*.tmp=38;5;246:*.7z=01;31:*.Z=01;31:*.ace=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cpio=01;31:*.deb=01;31:*.dz=01;31:*.ear=01;31:*.gz=01;31:*.jar=01;31:*.lz=01;31:*.lzh=01;31:*.lzma=01;31:*.rar=01;31:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.war=01;31:*.xz=01;31:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.anx=01;35:*.asf=01;35:*.avi=01;35:*.axv=01;35:*.bmp=01;35:*.cgm=01;35:*.dl=01;35:*.emf=01;35:*.flc=01;35:*.fli=01;35:*.flv=01;35:*.gif=01;35:*.gl=01;35:*.jpeg=01;35:*.jpg=01;35:*.m2v=01;35:*.m4v=01;35:*.mkv=01;35:*.mng=01;35:*.mov=01;35:*.mp4=01;35:*.mp4v=01;35:*.mpeg=01;35:*.mpg=01;35:*.nuv=01;35:*.ogm=01;35:*.ogv=01;35:*.ogx=01;35:*.pbm=01;35:*.pcx=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.qt=01;35:*.rm=01;35:*.rmvb=01;35:*.svg=01;35:*.svgz=01;35:*.tga=01;35:*.tif=01;35:*.tiff=01;35:*.vob=01;35:*.webm=01;35:*.wmv=01;35:*.xbm=01;35:*.xcf=01;35:*.xpm=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=01;33:*.au=01;33:*.flac=01;33:*.mid=01;33:*.midi=01;33:*.mka=01;33:*.mp3=01;33:*.mpc=01;33:*.ogg=01;33:*.ra=01;33:*.wav=01;33:*.axa=01;33:*.oga=01;33:*.spx=01;33:*.xspf=01;33:*.doc=38;5;109:*.docx=38;5;109:*.html=38;5;109:*.js=38;5;109:*.json=38;5;109:*.md=38;5;109:*.neon=38;5;109:*.odp=38;5;109:*.ods=38;5;109:*.odt=38;5;109:*.pdf=38;5;109:*.php=38;5;109:*.phtml=38;5;109:*.ppt=38;5;109:*.pptx=38;5;109:*.tex=38;5;109:*.txt=38;5;109:*.xls=38;5;109:*.xlsx=38;5;109:*.xml=38;5;109:';
export LS_COLOR
