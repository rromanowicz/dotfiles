#!/bin/bash

HDMI_DISCONNECTED=$(xrandr | grep 'HDMI' | grep 'disconnected')
HDMI=$(xrandr | grep 'HDMI')

if [[ $HDMI_DISCONNECTED ]]; then
  xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
else
  arr=($HDMI)
  val=${arr[0]}
  xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output $val --mode 2560x1440 --pos 1920x0 --rotate normal
fi
