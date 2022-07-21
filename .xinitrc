#!/bin/sh 
lxpolkit & 
cbatticon & 
udiskie -a & 
picom & 
mpd &

session=${1:-bspwm}

case $session in
    bspwm|b)
		 dunst &
		 sxhkd &
		 polybar &
		 xsetroot -cursor_name left_ptr &
		 $HOME/.local/bin/fehbg &
		 exec bspwm;;
    dwm|d)
		 dunst &
		 slstatus &
		 xbindkeys -f $HOME/.config/xbindkeys/config &
		 $HOME/.local/bin/fehbg &
		 exec dwm;;
    awesome|a)
		 exec awesome;;
    *) 
		 exec $1;;
esac

