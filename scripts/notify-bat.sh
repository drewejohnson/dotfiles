#!/bin/bash
# Script to do battery management/notices

#
# Config settings
#
short_sleep=10
low_at=15  # merit a low priority notice
crit_at=10 # merit a critical notice
app_name="notify-bat"

#
# Paths
# 
P_AC=/sys/class/power_supply/AC
P_B0=/sys/class/power_supply/BAT0
P_B1=/sys/class/power_supply/BAT1

#
# Status flags
# 0 - charging and/or above upper threshold
# 1 - not charging and between upper and lower threshold
# 2 - not charing and under lowest threshold
#
stat=4
# run run run

while true; do

    prev_stat=$stat

    is_charging=$(cat $P_AC/online)

    if [ $is_charging -eq 1 ]; then
        stat=0
    else
        cap0=$(cat $P_B0/capacity)
        cap1=$(cat $P_B1/capacity)
        cap=$((cap0 + cap1))
        cap=$((cap / 2))

        if [ $cap -le $crit_at ]; then
            urgency=critical
            stat=2
        elif [ $cap -le $low_at ]; then
            urgency=normal
            stat=1
        else
            stat=0
        fi
        
        if [ $stat -ne 0 ] && [ $stat -gt $prev_stat ]; then
            notify-send -u $urgency -a $app_name "Battery status ${cap}%"
        fi

    fi

    sleep $short_sleep
done
