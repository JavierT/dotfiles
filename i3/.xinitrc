#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Source .Xresources, no DM
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Setup displays, no DM. Setup_displays is a symlink to one of the custom xrandr
# files in ~/bin. Doing it this way because I use a different `xrandr_X` script
# depending on which system I am using
# Note: has to be after .Xresources
source ~/bin/setup_displays

# xprofile support, with or without DM
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec i3
