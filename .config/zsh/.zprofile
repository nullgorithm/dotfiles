# test if command is available
have() { which $1 &>/dev/null || return 1 }

# set secure umask
umask 077

# constant environment variables {{{
export PATH="/usr/lib/colorgcc/bin:$PATH:$HOME/.local/bin"

# man page colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# disable less history file and display color control sequences as colors
export LESSHISTFILE=- \
  LESS=-R

# highest compression
export GZIP=-9 \
  BZIP=-9 \
  XZ_OPT=-9

# use a 32-bit wine prefix
export WINEARCH=win32

# disable wine debug messages
export WINEDEBUG=-all

# disable wine desktop integration (menu items, desktop links, mimetypes)
export WINEDLLOVERRIDES='winemenubuilder.exe=d'

# turn on font antialiasing in java
export _JAVA_OPTIONS=-Dawt.useSystemAAFontSettings=lcd

# export gtkrc location for qt
export GTK2_RC_FILES=~/.gtkrc-2.0

# colors
export GREP_OPTIONS='--color=auto'
eval $(dircolors -b ~/.config/dircolors)

# set path to mpd socket
export MPD_HOST=~/music/socket

export PYTHONSTARTUP=~/.config/pythonrc
# }}}

if (( UID )); then
  [[ -z $DISPLAY ]] && exec startx &> ~/.xlog
fi
