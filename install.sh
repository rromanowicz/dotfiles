#!/bin/bash

PWD=$(pwd)"/.config"
CONF_DIR=~/.config

function create_symlink {
	TRGT=$CONF_DIR"/$1"
	SRC=$PWD"/$1"
	[[ -d $CONF_DIR"/$1" ]] && mv $TRGT $TRGT".old"
	ln -sf $SRC $TRGT
}

APPS=("bashtop" "kitty" "ranger" "polybar" "nvim" "lvim" "i3")
for i in "${APPS[@]}"
do
	echo "Adding $i configuration."
	create_symlink "$i"
done

echo ""
echo "-----------------------------"
echo "All done."
