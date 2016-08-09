#!/bin/sh

# as seen on https://montemazuma.wordpress.com/2010/03/01/moving-a-gpg-key-privately/

if [ "$#" -ne 1 ] ; then
	echo "usage: $0 [key file]"
	exit 1
fi

KEYFILE=$1

gpg --no-use-agent --output - ${KEYFILE} | \
	gpg --import

