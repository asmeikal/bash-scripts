#!/bin/bash

print_usage () {
	echo "usage: $0 inputfile.svg [outputfile.png]"
}

build_png_filename () {
	echo "$1" | sed -e 's/.svg/.png/g'
}

if [ "$1" = "" ] ; then
	print_usage
	exit 1
fi

if [ "$2" = "" ] ; then
	OUTPUT=`build_png_filename $1`
else
	OUTPUT=$2
fi

echo "Converting $1 to $OUTPUT ..."

inkscape -z -T -e $OUTPUT $1
