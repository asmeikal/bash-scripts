#!/bin/sh

# as seen on https://montemazuma.wordpress.com/2010/03/01/moving-a-gpg-key-privately/

KEYFILE=$1

gpg --no-use-agent --output - ${KEYFILE} | \
	gpg --import

