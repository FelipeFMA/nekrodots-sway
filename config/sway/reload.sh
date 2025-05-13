#!/bin/dash

# A stupidly simple script to reload sway, waybar, swaync and autotiling.
# https://github.com/FelipeFMA/nekrodots-sway



#######################

# Reload waybar
killall waybar

sleep 0.1

waybar &

#######################

# Reload sway
swaymsg reload

#######################

# Reload swaync
killall dunst

sleep 0.1

dunst &

#######################

# Reload autotiling
killall autotiling

sleep 0.1

autotiling &
