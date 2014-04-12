#!/bin/sh
#################################################
# file: ~/.xinitrc
# author: serdotlinecho
# vim:fenc=utf-8:ai:si:et:ts=4:sw=4:ft=sh:
#################################################

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xset +fp /usr/share/fonts/local
xset +fp $HOME/.fonts
xset fp rehash

# load up Xresources
xrdb -merge $HOME/.Xresources

# start some nice program
urxvtd -q -o -f &
xautolock &

# launch window manager
exec awesome
