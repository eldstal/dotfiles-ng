#!/bin/bash

#BAT="/sys/class/power_supply/BAT0"
#AC="/sys/class/power_supply/AC"
#
#PERCENTAGE=$(cat ${BAT}/capacity)
#
#IS_CHARGING=0
#cat ${BAT}/status | grep -q "Charging" && IS_CHARGING=1

PERCENTAGE=$(upower -b | grep 'percentage:' | awk '{print $2}' | sed -re 's/(\..*)|(%)//')
IS_DISCHARGING=0
upower -b | grep 'state:' | awk '{print $2}' | grep -q "discharging" && IS_DISCHARGING=1


MARKER="↑"
[ ${IS_DISCHARGING} -eq 1 ] && MARKER="↓"


COLOR="#FF0000"

if [ $PERCENTAGE -gt 75 ];then
    COLOR="#80FF55"
elif [ $PERCENTAGE -gt 50 ]; then
    COLOR="#FFFF55"
elif [ $PERCENTAGE -gt 15 ]; then
    COLOR="#FF8080"
fi

echo "B: ${MARKER} <span foreground=\"${COLOR}\">${PERCENTAGE}</span>"
