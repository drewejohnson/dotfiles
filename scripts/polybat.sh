#!/bin/bash
# Script to notify polybar about battery status

# Settings to customize the output

WARN_AT=15  # Use the IC_LOW icon if battery under this
IC_CHARING=
IC_NOMINAL=""
IC_LOW=

# Paths to batteries and power supply
P_AC=/sys/class/power_supply/AC
P_B0=/sys/class/power_supply/BAT0
P_B1=/sys/class/power_supply/BAT1

# main script

is_charging=$(cat $P_AC/online)
cap0=$(cat $P_B0/capacity)
cap1=$(cat $P_B1/capacity)
cap=$((cap0 + cap1))
cap=$((cap / 2))

# Get the icon
if [ $is_charging -eq 1 ]; then
    icon=$IC_CHARING
elif [ $cap -le $WARN_AT ]; then
    icon=$IC_LOW
else
    icon=$IC_NOMINAL
fi

echo ${icon} ${cap}%
