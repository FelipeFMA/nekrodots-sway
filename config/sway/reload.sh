#!/bin/bash

# A stupidly simple script to reload sway, waybar and swaync.
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
killall swaync

sleep 0.1

swaync &

