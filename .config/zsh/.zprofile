# test if command is available
have() { which $1 &>/dev/null || return 1 }

# set secure umask
umask 077

# constant environment variables {{{
export PATH="/usr/lib/colorgcc/bin:$PATH:$HOME/bin"

export EDITOR=/usr/bin/vim \
    VISUAL=/usr/bin/vim \
    PAGER=less

if have vimpager; then
    export MANPAGER=vimpager
else
    export MANPAGER=$PAGER
fi

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
eval $(dircolors -b)

# set path to mpd socket
export MPD_HOST=~/music/socket

export PYTHONSTARTUP=~/.config/pythonrc
# }}}

if [[ -z $DISPLAY && $(tty) = /dev/tty2 ]]; then
    exec xinit ~/.config/xinitrc -- /usr/bin/X -nolisten tcp vt07 &>/dev/null
fi
