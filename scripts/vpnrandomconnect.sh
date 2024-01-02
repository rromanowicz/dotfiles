#!/bin/bash

countries=("Czech_Republic" "Sweden" "Finland")
RANDOM=$$$(date +%s)
STATUS=$(nordvpn status | grep 'Status' | sed -En 's/Status: //p')

if [[ $STATUS = *"Disconnected" ]] ; then
  selected=${countries[ $RANDOM % ${#countries[@]} ]}
  nordvpn c $selected
else
  nordvpn d
fi
