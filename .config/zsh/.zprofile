# set secure umask
umask 077

# constant environment variables {{{
export PATH="$PATH:$HOME/.local/bin:$HOME/.gem/ruby/2.3.0/bin"
export PATH="$PATH:$HOME/projects/copperhead/copperheados/depot_tools"
export BUNDLE_PATH="$HOME/.gem"

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

# NVIDIA shader cache
export __GL_SHADER_DISK_CACHE_PATH=~/.cache/nv
# }}}

if (( UID )); then
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi
