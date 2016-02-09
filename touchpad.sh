#!/bin/bash

TOUCHPAD="SynPS/2 Synaptics TouchPad"
PROPERTY="Device Enabled"

usage() {
	SCRIPT_NAME=`echo $0 | sed -r -e "s/.*\///"`
	echo "Usage:$SCRIPT_NAME [on|off]"
	echo "With no argument toggles touchpad."
}

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

if [[ $# > 1 ]] ; then
	usage
	exit 1
fi

case $1 in
	"on") set_touchpad 1
		;;
	"off") set_touchpad 0
		;;
	"") toggle_touchpad
		;;
	*) usage
		exit 1
		;;
esac

