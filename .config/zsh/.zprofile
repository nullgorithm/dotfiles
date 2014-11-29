# set secure umask
umask 077

# constant environment variables {{{
export CHROMIUM_USER_FLAGS='--password-store=gnome --ppapi-flash-path=/usr/lib/PepperFlash/libpepflashplayer.so --ppapi-flash-version=15.0.0.239'
export PATH="/usr/lib/colorgcc/bin:$PATH:$HOME/.local/bin"

# man page colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# disable less history file
export LESSHISTFILE=-

# highest compression
export GZIP=-9 \
  BZIP=-9 \
  XZ_OPT=-9

# turn on font antialiasing in java
export _JAVA_OPTIONS=-Dawt.useSystemAAFontSettings=lcd

# set location of gtk2 gtkrc (also needed for Qt's gtk style)
export GTK2_RC_FILES=~/.config/gtk-2.0/gtkrc

# colors
eval $(dircolors -b ~/.config/dircolors)

# set path to mpd socket
export MPD_HOST=~/music/socket

export PYTHONSTARTUP=~/.config/pythonrc
export MPV_HOME=~/.config/mpv
# }}}

if (( UID )); then
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi
