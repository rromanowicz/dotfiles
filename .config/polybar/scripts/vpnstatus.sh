#!/bin/bash

status=$(nordvpn status | grep "Status\|Country" | sed 's/.*: //' | sed 'N;s/\n/: /' | sed 's/Connected: //')

if [[ $status == "Disconnected" ]]; then
  echo '%{F#f00} %{F-}------'
else
  echo %{F#0f0} %{F-}$status
fi
