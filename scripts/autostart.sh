#!/bin/bash

exec $HOME/git/dotfiles/scripts/monitor.sh
exec $HOME/git/dotfiles/.config/polybar/launch.sh
exec $HOME/git/dotfiles/scripts/battery_threshold.sh
