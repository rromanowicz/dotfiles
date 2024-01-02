#!/bin/bash

COUNTRY_LIST=$(nordvpn countries | awk '$1=$1' | sed ':a;N;$!ba;s/\n/ /g')
IFS=' ' read -r -a COUNTRY_ARR <<< $COUNTRY_LIST

echo "$COUNTRY_LIST"

for element in "${COUNTRY_ARR[@]}"
do
    echo "$element"
done

