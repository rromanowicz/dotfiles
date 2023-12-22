#!/bin/bash
echo "$(<$HOME/pas)" | su -c 'echo 60 > /sys/class/power_supply/BAT0/charge_control_end_threshold'
