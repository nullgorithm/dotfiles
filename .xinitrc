#!/bin/zsh

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [[ -x $f ]] && . $f
  done
  unset f
fi

export $(gnome-keyring-daemon -s)

synclient HorizTwoFingerScroll=1
xset -b
setxkbmap -option ctrl:nocaps
setxkbmap -option shift:both_shiftlock
hsetroot -full ~/images/background.png
exec i3
