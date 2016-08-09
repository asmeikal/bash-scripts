#!/bin/sh

GRAPHICS="graphical.target"
NOGRAPHICS="multi-user.target"

TARGET=$NOGRAPHICS

case $1 in
	"enable")
		TARGET=$GRAPHICS
	;;
	"disable")
		TARGET=$NOGRAPHICS
	;;
	"")
		TARGET=$NOGRAPHICS
	;;
	*)
		echo "usage: sudo $0 [enable|disable]"
		exit 1
	;;
esac

echo "systemctl enable $TARGET"
systemctl enable $TARGET
echo "systemctl set-default $TARGET"
systemctl set-default $TARGET

