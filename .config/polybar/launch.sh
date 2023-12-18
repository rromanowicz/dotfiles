#!/usr/bin/env bash

THEME="v3"

killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

CONFIG_DIR=~/git/dotfiles/.config/polybar/themes/$THEME/config.ini
polybar primary -c $CONFIG_DIR &
polybar secondary -c $CONFIG_DIR &
