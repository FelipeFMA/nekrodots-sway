#!/bin/dash

CHOICE=$(echo "󰤄  Suspend\n󰐥  Shutdown\n󰜉  Reboot" | wmenu  -p "Bye! " -b -f "SF Mono 10" -N 282828 -n ebdbb2 -M 3c3836 -m fe8019 -S 458588 -s ebdbb2)

case $CHOICE in
"󰤄  Suspend")
systemctl suspend
;;
"󰐥  Shutdown")
systemctl poweroff
;;
"󰜉  Reboot")
systemctl reboot
;;
*)
exit 0
;;
esac
