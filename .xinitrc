#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

mkdir -p /tmp/adobe-$USER /tmp/macromedia-$USER
synclient HorizTwoFingerScroll=1
xset -b
setxkbmap -option ctrl:nocaps
setxkbmap -option shift:both_shiftlock
xmodmap -e "keycode 135 = Super_R"
hsetroot -full ~/images/background.png
exec i3
