#!/bin/bash
# Things to launch at start of i3

# dunst
killall -q dunst
while pgrep -x dunst >/dev/null; do sleep 1; done
dunst -config ~/.config/dunst/dunstrc
