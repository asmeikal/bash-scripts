#!/bin/sh

# as seen on https://montemazuma.wordpress.com/2010/03/01/moving-a-gpg-key-privately/

PUBKEY="tmp-pubkey.gpg"
OUTPUT="keys.asc"

if [ "$#" -ne 1 ] ; then
	echo "usage: $0 [key id]"
	exit 1
fi

KEYID=$1

gpg --list-public-keys ${KEYID}
if [ "$?" -ne 1 ] ; then
	echo "Public key \"${KEYID}\" not in keyring."
	exit 2
fi

gpg --list-private-keys ${KEYID}
if [ "$?" -ne 1 ] ; then
	echo "Private key \"${KEYID}\" not in keyring."
	exit 3
fi

gpg --output ${PUBKEY} --export ${KEYID}

gpg --output - --export-secret-key ${KEYID} | \
	cat ${PUBKEY} - | \
	gpg --armor --output ${OUTPUT} --symmetric --cipher-algo AES256

rm ${PUBKEY}

echo "Keypair saved to ${OUTPUT}."

