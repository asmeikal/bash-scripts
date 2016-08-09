#!/bin/sh

# as seen on https://montemazuma.wordpress.com/2010/03/01/moving-a-gpg-key-privately/

PUBKEY="tmp-pubkey.gpg"
OUTPUT="keys.asc"

if [ "$#" -ne 1 ] ; then
	echo "usage: $0 [key id]"
	exit 1
fi

KEYID=$1

gpg --output ${PUBKEY} --export ${KEYID}

gpg --output - --export-secret-key ${KEYID} | \
	cat ${PUBKEY} - | \
	gpg --armor --output ${OUTPUT} --symmetric --cipher-algo AES256

rm ${PUBKEY}

echo "Keypair saved to ${OUTPUT}."

