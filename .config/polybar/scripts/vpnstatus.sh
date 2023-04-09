#!/bin/bash

status=$(nordvpn status | grep "Status\|Country" | sed 's/.*: //' | sed 'N;s/\n/: /' | sed 's/Connected: //')

if [[ $status == "Disconnected" ]]; then
  echo '%{F#FF7575} %{F-}------'
else
  echo %{F#96F7C8} %{F-}$status
fi
