#!/bin/sh
# Shell script to send JSON information status information from
# conky to i3bar

echo '{"version":1}'
echo '['
echo '[],'

exec conky -c ~/.config/conky/conky-stat.conf 2>/dev/null
