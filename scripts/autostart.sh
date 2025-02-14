#!/bin/bash

sh ~/git/dotfiles/scripts/battery_threshold.sh
sh ~/git/dotfiles/scripts/monitor.sh
sh ~/git/dotfiles/scripts/vpnrandomconnect.sh
sh ~/git/dotfiles/.config/polybar/launch.sh

xset s off -dpms
