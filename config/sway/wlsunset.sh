#!/bin/dash

if pkill -x wlsunset; then
  echo "wlsunset was running and has been killed."
else
  echo "wlsunset was not running. Starting wlsunset -t 4000 -T 4001..."
  wlsunset -t 4000 -T 4001 &
  echo "wlsunset started with PID $!"
fi

exit 0
