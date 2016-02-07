#!/bin/bash

TOUCHPAD="SynPS/2 Synaptics TouchPad"
PROPERTY="Device Enabled"

set_touchpad() {
	xinput --set-prop "$TOUCHPAD" "$PROPERTY" $1
}

toggle_touchpad() {
	STATUS=`xinput --list-props "$TOUCHPAD" |
			grep "$PROPERTY" |
			sed -r -e "s/.*([0-1])$/\1/"`

	case $STATUS in
		"1") set_touchpad 0
			;;
		"0") set_touchpad 1
			;;
	esac
}

case $1 in
	"on") set_touchpad 1
		;;
	"off") set_touchpad 0
		;;
	*) toggle_touchpad
		;;
esac

