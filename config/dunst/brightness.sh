#!/bin/dash
# This is a shell script to change my display brightness and call a notification using dunst

msgId="3378423"

brightnessctl "$@" > /dev/null

brightness="$(brightnessctl g | awk '{print int($1)}')"
max_brightness="$(brightnessctl m | awk '{print int($1)}')"
percentage=$((brightness * 100 / max_brightness))

if [ "$brightness" = "0" ]; then
    dunstify -a "changeBrightness" -u low -i "dialog-information" -r "$msgId" "Brightness: OFF"
else
    dunstify -a "changeBrightness" -u low -i "dialog-information" -r "$msgId" \
    -h int:value:"$percentage" -t 2000 "Brightness: ${percentage}%"
fi
