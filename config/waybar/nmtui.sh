#!/bin/sh
nmtui="$(command -pv nmtui)" || exit 1
sleep 0.01; exec "$nmtui" "$@"
