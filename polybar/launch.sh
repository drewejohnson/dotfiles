#! /usr/bin/env sh

killall -q polybar

# wait for processes to shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 3; done

polybar main &

# Query additional monitors
xrandr -q | egrep -q "^DP2 connected" 
if [ $? -eq 0 ]; then
    polybar vga &
else
    echo "VGA not connected to DP2"
fi
