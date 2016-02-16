#!/bin/zsh

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [[ -x $f ]] && . $f
  done
  unset f
fi

export $(gnome-keyring-daemon -s)

xset -b
setxkbmap -option ctrl:nocaps -option shift:both_shiftlock
gm display -window root ~/images/background.png
exec i3
