#!/bin/bash

INTERFACE=${1:-eth0}
MARKER=${2:-E}

COLOR_DOWN="#FF8080"
COLOR_UP="#80FF55"
COLOR_MID="#FFFF55"

STATUS=$(ip -j addr show dev "${INTERFACE}")

IS_UP=0
echo "${STATUS}" | grep -q '"UP"' && IS_UP=1
echo "${STATUS}" | grep -q '"NO-CARRIER"' && IS_UP=0

if [ $IS_UP -eq 0 ]; then
    echo "${MARKER}: <span foreground=\"${COLOR_DOWN}\">down</span>"
    exit 0
fi

ADDR=$(echo "${STATUS}" | jq -r '.[].addr_info.[] | select(.family == "inet") | .local')

if [ -z "${ADDR}" ]; then
    echo "${MARKER}: <span foreground=\"${COLOR_MID}\">??</span>"
    exit 0

else
    echo "${MARKER}: <span foreground=\"${COLOR_UP}\">${ADDR}</span>"
    exit 0
fi
