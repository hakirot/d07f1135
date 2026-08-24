#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

~/.local/bin/newlook &
#xcompmgr &
picom --config ~/.config/picom.conf &
dunst &
xset dpms 0 0 0
xset s 0 0
nohup bash -c "sleep 3; xdotool key super+space" 2>&1 >/dev/null &
nohup bash -c "sleep 3; notify-send \"Welcome\" \"${USER}\" 2>&1 >/dev/null &
exec dwm
