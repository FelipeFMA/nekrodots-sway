#!/bin/dash

[ "$(id -u)" -ne 0 ] && exec sudo "$0" "$@"

PRIORITY=99
NICE=-20

PID=$(pidof sway)

if [ -n "$PID" ]; then
    renice -n "$NICE" -p "$PID"
    chrt -r -p "$PRIORITY" "$PID"
else
    echo "Error: 'sway' process not found." >&2
    exit 1
fi

chrt -p $(pidof sway)
