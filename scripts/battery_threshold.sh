#!/bin/bash
DOW=$(date +%u)
THRESHOLD=60

if [[ $DOW -eq 5 ]]; then
  THRESHOLD=80
elif [[ $DOW -eq 6 ]]; then
  THRESHOLD=100
fi

echo "$(<$HOME/pas)" | su -c "echo ${THRESHOLD} > /sys/class/power_supply/BAT0/charge_control_end_threshold"
